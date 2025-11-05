import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';

import '../data/repository/workout_repository.dart';
import '../state_holders/last_week_workout_state_holder.dart';


class LastWeekWorkoutsManager implements Lifecycle {
  final LastWeekWorkoutsStateHolder _stateHolder;
  final WorkoutRepository _workoutRepository;

  LastWeekWorkoutsManager(
      this._stateHolder,
      this._workoutRepository,
      );

  LastWeekWorkoutsStateHolder get stateHolder => _stateHolder;

  @override
  Future<void> init() async {
    await loadLastWeekWorkouts();
  }

  @override
  Future<void> dispose() async {
  }

  Future<void> loadLastWeekWorkouts() async {
    try {
      final workouts = await _workoutRepository.getLastWeekWorkouts();
      _stateHolder.updateWorkouts(workouts);
    } catch (e) {
      _stateHolder.clear();
    }
  }
}