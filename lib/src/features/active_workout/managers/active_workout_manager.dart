import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_managing/models/workout_segment.dart';
import 'package:sputnik_cardio/src/features/active_workout/state_holders/active_workout_state_holder.dart';

import '../../workout_managing/managers/workout_manager.dart';

class ActiveWorkoutManager extends Lifecycle {
  final ActiveWorkoutStateHolder _activeWorkoutStateHolder;
  final WorkoutManager _workoutManager;

  ActiveWorkoutManager(
    this._activeWorkoutStateHolder,
    this._workoutManager,
  );

  @override
  Future<void> init() async {
    final startSegment = WorkoutSegment(
      type: WorkoutSegmentType.run,
      startAt: DateTime.now(),
    );

    final workout = _workoutManager.addSegment(
      workout: _activeWorkoutStateHolder.state,
      segment: startSegment,
    );

    _activeWorkoutStateHolder.updateState(workout);
  }

  @override
  Future<void> dispose() async {}
}
