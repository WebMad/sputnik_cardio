import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';

import '../../workout_managing/models/workout.dart';

class WorkoutsListStateHolder extends StateHolder<List<Workout>?> {
  WorkoutsListStateHolder() : super(null);

  void update(List<Workout> workouts) {
    state = workouts;
  }
}
