import 'dart:async';

import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data_sources/workout_remote_data_source.dart';

import '../providers/workout_track_provider.dart';

class WorkoutCoordsLoaderManager implements Lifecycle {
  final int _workoutId;
  final WorkoutRemoteDataSource _workoutRemoteDataSource;
  final WorkoutTrackProvider _workoutTrackProvider;

  WorkoutCoordsLoaderManager(
    this._workoutId,
    this._workoutRemoteDataSource,
    this._workoutTrackProvider,
  );

  Future<void> load() async {
    // final workoutCoords =
    //     await _workoutRemoteDataSource.getWorkoutCoords(_workoutId);
    //
    // _workoutTrackProvider.pushAll(workoutCoords);
  }

  @override
  Future<void> init() async {
    unawaited(load());
  }

  @override
  Future<void> dispose() async {
    // empty
  }
}
