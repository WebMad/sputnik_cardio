import 'dart:async';

import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sputnik_cardio/src/features/tracking/managers/location_manager.dart';
import 'package:sputnik_cardio/src/features/tracking/presentation/presenters/tracking_presenter/tracking_holder.dart';
import 'package:sputnik_cardio/src/features/tracking/presentation/presenters/tracking_presenter/tracking_model.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data_sources/workout_remote_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/workout.dart';
import 'package:sputnik_cardio/src/features/workout_recording/providers/workout_track_provider.dart';

import '../../tracking/models/pos.dart';

class WorkoutCoordsRecordingManager implements Lifecycle {
  final LocationManager _locationManager;
  final TrackingHolder _trackingHolder;
  final WorkoutRemoteDataSource _workoutRemoteDataSource;
  final WorkoutTrackProvider _workoutTrackProvider;

  StreamSubscription<Pos>? _locationSub;

  WorkoutCoordsRecordingManager(
    this._locationManager,
    this._trackingHolder,
    this._workoutRemoteDataSource,
    this._workoutTrackProvider,
  );

  @override
  FutureOr<void> init() {}

  Future<void> startRecord(Workout workout) async {
    if (_locationSub != null) {
      return;
    }

    _locationSub = _locationManager.locationStream
        .throttleTime(const Duration(seconds: 1))
        .listen(
      (pos) {
        _workoutRemoteDataSource.recordWorkoutCoord(workout.id, pos);
        _workoutTrackProvider.push(pos);
      },
    );
  }

  Future<void> stopRecord() async {
    _workoutTrackProvider.clear();
    await _locationSub?.cancel();
    _locationSub = null;
  }

  @override
  FutureOr<void> dispose() async {
    await stopRecord();
  }
}
