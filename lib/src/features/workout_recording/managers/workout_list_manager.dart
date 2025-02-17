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
    // final workouts = await _workoutRemoteDataSource.list();
    //
    // final res = <WorkoutSummary>[];
    // for (final workout in workouts) {
    //   final workoutMetric =
    //       await _workoutRemoteDataSource.workoutMetrics(workout.id);
    //   res.add(
    //     WorkoutSummary(
    //       workout: workout,
    //       metrics: workoutMetric,
    //     ),
    //   );
    // }

    // _workoutsListStateHolder.update(res);
  }

  Future<void> removeWorkout(int workoutId) async {
    // await _workoutRemoteDataSource.removeWorkout(workoutId);
    // await load();
  }
}
