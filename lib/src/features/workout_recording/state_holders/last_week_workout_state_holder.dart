import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/detailed_workout.dart';

class LastWeekWorkoutsStateHolder extends StateHolder<List<DetailedWorkout>> {
  LastWeekWorkoutsStateHolder() : super([]);

  void updateWorkouts(List<DetailedWorkout> workouts) {
    state = List<DetailedWorkout>.from(workouts);
  }

  void clear() {
    state = [];
  }
}
