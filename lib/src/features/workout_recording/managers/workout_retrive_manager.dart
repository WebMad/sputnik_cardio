import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_managing/models/workout.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data_sources/workout_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_recording/managers/workout_lifecycle_manager.dart';

class WorkoutRetriveManager implements Lifecycle {
  final WorkoutDataSource _workoutDataSource;

  final WorkoutLifecycleManager _workoutLifecycleManager;

  WorkoutRetriveManager(
    this._workoutDataSource,
    this._workoutLifecycleManager,
  );

  @override
  Future<void> init() async {
    final workouts = await _workoutDataSource.getActiveWorkouts();

    final lastWorkoutUuid = workouts.lastOrNull;

    if (lastWorkoutUuid == null) {
      return;
    }

    final lastWorkout = await _workoutDataSource.getWorkout(lastWorkoutUuid);

    if (lastWorkout == null || lastWorkout.state == WorkoutState.stopped) {
      return;
    }

    _workoutLifecycleManager.retrive(lastWorkout);
  }

  @override
  Future<void> dispose() async {}
}
