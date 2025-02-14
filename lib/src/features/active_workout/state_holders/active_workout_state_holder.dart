import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_managing/models/workout.dart';

class ActiveWorkoutStateHolder extends StateHolder<Workout> {
  ActiveWorkoutStateHolder(super.state);

  void updateState(Workout newState) {
    state = newState;
  }
}
