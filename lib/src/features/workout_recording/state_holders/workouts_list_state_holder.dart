import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/workout.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/workout_summary.dart';

class WorkoutsListStateHolder extends StateHolder<List<WorkoutSummary>?> {
  WorkoutsListStateHolder() : super(null);

  void update(List<WorkoutSummary> workouts) {
    state = workouts;
  }
}
