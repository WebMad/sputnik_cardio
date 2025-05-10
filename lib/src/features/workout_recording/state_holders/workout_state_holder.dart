import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_core/models/workout.dart';
import 'package:sputnik_cardio/src/features/workout_core/models/workout_segment.dart';

import '../../workout_core/providers/workout_provider.dart';

class WorkoutStateHolder extends StateHolder<Workout?>
    implements WorkoutProvider {
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

  @override
  void update(Workout? workout) {
    state = workout;
  }

  @override
  Workout? get workout => state;

  @override
  Stream<Workout?> get workoutStream => stream;
}
