import 'package:sputnik_cardio/src/features/workout_recording/data/data_sources/workout_remote_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/workouts_list_data.dart';
import 'package:sputnik_cardio/src/features/workout_recording/state_holders/workouts_list_state_holder.dart';

class WorkoutListManager {
  static const _limit = 100;

  final WorkoutRemoteDataSource _workoutRemoteDataSource;
  final WorkoutsListStateHolder _workoutsListStateHolder;

  bool isLoading = false;

  WorkoutListManager(
    this._workoutRemoteDataSource,
    this._workoutsListStateHolder,
  );

  Future<void> refresh() async {
    _workoutsListStateHolder.update(const WorkoutsListData.loading());
    await load();
  }

  Future<void> load() async {
    try {
      isLoading = true;

      final currentOffset =
          _workoutsListStateHolder.state.dataOrNull?.offset ?? 0;

      final previousState = _workoutsListStateHolder.state.dataOrNull
              ?.copyWith(offset: currentOffset + _limit) ??
          WorkoutsListData.data(offset: currentOffset, workouts: [])
              as DataWorkoutsListData;

      final workouts = await _workoutRemoteDataSource.list(
        offset: previousState.offset,
        limit: _limit,
      );

      _workoutsListStateHolder.update(previousState.copyWith(
        workouts: [...previousState.workouts, ...workouts],
      ));
    } finally {
      isLoading = false;
    }
  }

  Future<void> handleAtEdge() async {
    if (!isLoading) {
      await load();
    }
  }

  Future<void> removeWorkout(String workoutUuid) async {
    await _workoutRemoteDataSource.deleteWorkout(workoutUuid);
    await load();
  }
}
