import 'package:sputnik_cardio/src/features/workout_managing/models/workout_segment.dart';
import 'package:sputnik_cardio/src/features/active_workout/state_holders/active_workout_state_holder.dart';
import 'package:sputnik_cardio/src/features/workout_managing/managers/workout_manager.dart';

class WorkoutInteractionManager {
  final ActiveWorkoutStateHolder _activeWorkoutStateHolder;
  final WorkoutManager _workoutManager;

  const WorkoutInteractionManager(
    this._activeWorkoutStateHolder,
    this._workoutManager,
  );

  void stop() {
    final now = DateTime.now();

    final segments = [..._activeWorkoutStateHolder.state.segments];
    if (segments.isNotEmpty) {
      final lastSegment = segments.removeLast().copyWith(
            endAt: now,
          );
      segments.add(lastSegment);
    }

    _activeWorkoutStateHolder.updateState(
      _activeWorkoutStateHolder.state.copyWith(
        segments: segments,
      ),
    );
  }

  void pause() {
    final now = DateTime.now();

    _activeWorkoutStateHolder.updateState(
      _workoutManager.addSegment(
        workout: _activeWorkoutStateHolder.state,
        segment: WorkoutSegment(
          type: WorkoutSegmentType.pause,
          startAt: now,
        ),
      ),
    );
  }

  void play() {
    final now = DateTime.now();

    _activeWorkoutStateHolder.updateState(
      _workoutManager.addSegment(
        workout: _activeWorkoutStateHolder.state,
        segment: WorkoutSegment(
          type: WorkoutSegmentType.run,
          startAt: now,
        ),
      ),
    );
  }
}
