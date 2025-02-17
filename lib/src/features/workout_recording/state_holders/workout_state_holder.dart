import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_managing/models/workout.dart';

class WorkoutStateHolder extends StateHolder<Workout?> {
  WorkoutStateHolder() : super(null);

  void updateState(Workout? workout) {
    state = workout;
  }
}
