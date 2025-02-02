import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/tracking/presentation/presenters/tracking_presenter/tracking_holder.dart';
import 'package:sputnik_cardio/src/features/tracking/tracking_deps_node.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data_sources/workout_remote_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_recording/managers/workout_coords_recording_manager.dart';
import 'package:sputnik_cardio/src/features/workout_recording/metrics_calculators/avg_speed_calculator.dart';
import 'package:sputnik_cardio/src/features/workout_recording/metrics_calculators/km_metric_calculator.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/workout.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/workout_metrics.dart';
import 'package:sputnik_cardio/src/features/workout_recording/realtime_metrics_deps_node.dart';
import 'package:uuid/uuid.dart';

import '../../tracking/managers/location_manager.dart';
import '../../tracking/presentation/presenters/tracking_presenter/tracking_model.dart';
import '../providers/workout_track_provider.dart';

class WorkoutLifecycleManager {
  final WorkoutRemoteDataSource _workoutRemoteDataSource;
  final LocationManager _locationManager;
  final TrackingHolder _trackingHolder;
  final WorkoutCoordsRecordingManager _workoutCoordsRecordingManager;
  final LocationDepsNode _locationDepsNode;
  final WorkoutTrackProvider _workoutTrackProvider;

  RealtimeMetricsDepsNode? _realtimeMetricsDepsNode;

  WorkoutLifecycleManager(
    this._workoutRemoteDataSource,
    this._locationManager,
    this._trackingHolder,
    this._workoutCoordsRecordingManager,
    this._locationDepsNode,
    this._workoutTrackProvider,
  );

  Future<void> start() async {
    final location = await _locationManager.location;

    final workout = await _workoutRemoteDataSource.create(startPos: location);

    await _workoutCoordsRecordingManager.startRecord(workout);

    final realtimeMetricsContainer = RealtimeMetricsDepsNode(
      _locationDepsNode,
    );

    await _realtimeMetricsDepsNode?.init();

    _trackingHolder.update(TrackingModel.played(
      workout: workout,
    ));
  }

  RealtimeMetricsDepsNode? get realtimeMetricsDepsNode =>
      _realtimeMetricsDepsNode;

  Future<void> stop() async {
    final location = await _locationManager.location;

    final workout = _trackingHolder.state.getWorkout.copyWith(
      endPos: location,
      status: WorkoutState.stopped,
      stopAt: DateTime.now(),
    );

    await _workoutRemoteDataSource.createWorkoutMetrics(
      WorkoutMetrics(
        kms: KmMetricCalculator().calc(_workoutTrackProvider.track),
        avgSpeed: AvgSpeedCalculator().calc(_workoutTrackProvider.track),
        workoutId: workout.id,
      ),
    );

    await _workoutRemoteDataSource.update(workout);

    await _realtimeMetricsDepsNode?.dispose();
    _realtimeMetricsDepsNode = null;

    await _workoutCoordsRecordingManager.stopRecord();

    _trackingHolder.update(
      TrackingModel.stopped(
        workout: workout,
      ),
    );
  }
}
