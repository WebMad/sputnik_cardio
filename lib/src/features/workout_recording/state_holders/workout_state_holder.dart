import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_core/models/workout.dart';
import 'package:sputnik_cardio/src/features/workout_core/models/workout_segment.dart';

class PersistentWorkoutStateHolder extends StateHolder<Workout?> {
  PersistentWorkoutStateHolder() : super(null);

  void updateState(Workout? workout) {
    state = workout;
  }

  String? get currentSegmentRouteUuid {
    final workoutSegments = state?.segments;
    if (workoutSegments == null || workoutSegments.isEmpty) {
      return null;
    }

    return workoutSegments.last.routeUuid;
  }

  WorkoutSegment? get lastSegment => state?.lastSegment;

  void update(Workout? workout) {
    state = workout;
  }
}
