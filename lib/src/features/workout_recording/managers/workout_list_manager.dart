import 'package:sputnik_cardio/src/features/workout_recording/data/data_sources/workout_remote_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_recording/state_holders/workouts_list_state_holder.dart';

import '../../workout_managing/models/workout.dart';

class WorkoutListManager {
  final WorkoutRemoteDataSource _workoutRemoteDataSource;
  final WorkoutsListStateHolder _workoutsListStateHolder;

  WorkoutListManager(
    this._workoutRemoteDataSource,
    this._workoutsListStateHolder,
  );

  Future<void> load() async {
    final workouts = await _workoutRemoteDataSource.list();

    _workoutsListStateHolder.update(workouts);
  }

  Future<void> removeWorkout(String workoutUuid) async {
    await _workoutRemoteDataSource.deleteWorkout(workoutUuid);
    await load();
  }
}
