import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_core/workout_core.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_sources/workout_local_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/repository/workout_repository.dart';
import 'package:sputnik_cardio/src/features/workout_recording/managers/workout_lifecycle_manager.dart';

class WorkoutRetriveManager implements Lifecycle {
  final WorkoutRepository _workoutRepository;

  final WorkoutLifecycleManager _workoutLifecycleManager;

  WorkoutRetriveManager(
    this._workoutLifecycleManager,
    this._workoutRepository,
  );

  @override
  Future<void> init() async {
    final workouts = await _workoutRepository.getActiveWorkouts();

    if (workouts.isEmpty) {
      return;
    }

    final workout = workouts.last;

    if (workout.state == WorkoutState.stopped) {
      _workoutRepository.removeActiveWorkout(workout);
      return;
    }

    _workoutLifecycleManager.retrive(workout);
  }

  @override
  Future<void> dispose() async {}
}
