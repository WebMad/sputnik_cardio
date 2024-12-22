import 'package:sputnik_cardio/src/features/workout_recording/data_sources/workout_remote_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_recording/state_holders/workouts_list_state_holder.dart';

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
}
