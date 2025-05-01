import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_managing/models/workout.dart';
import 'package:sputnik_cardio/src/features/workout_managing/models/workout_segment.dart';

class WorkoutStateHolder extends StateHolder<Workout?> {
  WorkoutStateHolder() : super(null);

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
}
