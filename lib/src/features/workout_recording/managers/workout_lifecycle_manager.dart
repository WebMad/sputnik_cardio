import 'package:sputnik_cardio/src/features/tracking/presentation/presenters/tracking_presenter/tracking_holder.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data_sources/workout_remote_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_recording/managers/workout_coords_recording_manager.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/workout.dart';
import 'package:uuid/uuid.dart';

import '../../tracking/managers/location_manager.dart';
import '../../tracking/presentation/presenters/tracking_presenter/tracking_model.dart';

class WorkoutLifecycleManager {
  final WorkoutRemoteDataSource _workoutRemoteDataSource;
  final LocationManager _locationManager;
  final TrackingHolder _trackingHolder;
  final WorkoutCoordsRecordingManager _workoutCoordsRecordingManager;

  // final Uuid _uuid;

  WorkoutLifecycleManager(
    this._workoutRemoteDataSource,
    this._locationManager,
    this._trackingHolder,
    this._workoutCoordsRecordingManager,
    // this._uuid,
  );

  Future<void> start() async {
    final location = await _locationManager.location;

    final workout = await _workoutRemoteDataSource.create(startPos: location);

    _trackingHolder.update(TrackingModel.played(
      workout: workout,
    ));

    await _workoutCoordsRecordingManager.startRecord();
  }

  Future<void> stop() async {
    final location = await _locationManager.location;

    final workout = _trackingHolder.state.getWorkout.copyWith(
      endPos: location,
      status: WorkoutState.stopped,
      stopAt: DateTime.now(),
    );

    await _workoutRemoteDataSource.update(workout);

    _trackingHolder.update(
      TrackingModel.stopped(
        workout: workout,
      ),
    );

    await _workoutCoordsRecordingManager.stopRecord();
  }
}
