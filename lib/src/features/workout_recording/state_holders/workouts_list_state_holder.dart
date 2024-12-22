import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/workout.dart';

class WorkoutsListStateHolder extends StateHolder<List<Workout>?> {
  WorkoutsListStateHolder() : super(null);

  void update(List<Workout> workouts) {
    state = workouts;
  }
}