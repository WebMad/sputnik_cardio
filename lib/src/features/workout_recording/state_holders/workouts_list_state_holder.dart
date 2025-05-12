import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/detailed_workout.dart';


class WorkoutsListStateHolder extends StateHolder<List<DetailedWorkout>?> {
  WorkoutsListStateHolder() : super(null);

  void update(List<DetailedWorkout> workouts) {
    state = workouts;
  }
}
