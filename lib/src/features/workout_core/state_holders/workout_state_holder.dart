import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_core/providers/workout_provider.dart';

import '../models/workout.dart';

class WorkoutStateHolder extends StateHolder<Workout>
    implements WorkoutProvider {
  WorkoutStateHolder(super.state);

  void update(Workout workout) {
    state = workout;
  }

  @override
  Workout get workout => state;

  @override
  Stream<Workout> get workoutStream => stream;
}
