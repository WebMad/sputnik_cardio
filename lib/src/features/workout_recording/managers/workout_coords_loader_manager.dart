import 'package:sputnik_cardio/src/features/workout_recording/data_sources/workout_remote_data_source.dart';

import '../providers/workout_track_provider.dart';

class WorkoutCoordsLoaderManager {
  final WorkoutRemoteDataSource _workoutRemoteDataSource;
  final WorkoutTrackProvider _workoutTrackProvider;

  WorkoutCoordsLoaderManager(
    this._workoutRemoteDataSource,
    this._workoutTrackProvider,
  );

  Future<void> load(int workoutId) async {
    final workoutCoords =
        await _workoutRemoteDataSource.getWorkoutCoords(workoutId);

    _workoutTrackProvider.pushAll(workoutCoords);
  }
}
