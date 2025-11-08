import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_models/pending_workout.dart';

class PendingWorkoutsStateHolder extends StateHolder<List<PendingWorkout>> {
  PendingWorkoutsStateHolder() : super([]);

  void update(List<PendingWorkout> pendingWorkouts) {
    state = pendingWorkouts;
  }

  void add(PendingWorkout pendingWorkout) {
    state = [...state, pendingWorkout];
  }

  void remove(PendingWorkout pendingWorkout) {
    state = state
        .where((element) => element.workout.uuid != pendingWorkout.workout.uuid)
        .toList();
  }
}
