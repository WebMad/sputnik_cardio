import 'package:sputnik_cardio/src/features/workout_core/factories/workout_segment_factory.dart';
import 'package:sputnik_cardio/src/features/workout_core/providers/workout_provider.dart';
import 'package:sputnik_cardio/src/features/workout_core/state_holders/workout_state_holder.dart';
import 'package:uuid/uuid.dart';

import '../models/workout.dart';
import '../models/workout_segment.dart';

class WorkoutModificationManager {
  final WorkoutSegmentFactory _workoutSegmentFactory;
  final Uuid uuid;
  final WorkoutStateHolder _workoutStateHolder;

  const WorkoutModificationManager(
    this.uuid,
    this._workoutSegmentFactory,
    this._workoutStateHolder,
  );

  WorkoutProvider get workoutProvider => _workoutStateHolder;

  void retrive(Workout workout) {
    _workoutStateHolder.update(workout);
  }

  void pause([
    DateTime? startAt,
  ]) {
    _workoutStateHolder.update(
      _workoutStateHolder.state.copyWith(state: WorkoutState.paused),
    );

    addSegment(
      segmentType: WorkoutSegmentType.pause,
      startAt: startAt,
    );
  }

  void stop() {
    _workoutStateHolder.update(
      _workoutStateHolder.state.copyWith(
        stopAt: DateTime.now(),
        state: WorkoutState.stopped,
      ),
    );
    finishSegment();
  }

  void resume() {
    _workoutStateHolder.update(
      _workoutStateHolder.state.copyWith(state: WorkoutState.inProcess),
    );
    addSegment(segmentType: WorkoutSegmentType.run);
  }

  void addSegment({
    required WorkoutSegmentType segmentType,
    DateTime? startAt,
  }) {
    final segments = [..._workoutStateHolder.state.segments];

    final segment = _workoutSegmentFactory.create(
      segmentType,
      uuid.v4(),
      startAt,
    );

    if (segments.isNotEmpty) {
      final lastSegment = segments.removeLast();
      final newLastSegment = lastSegment.copyWith(
        endAt: lastSegment.endAt ?? segment.startAt,
      );

      segments.add(newLastSegment);
    }

    segments.add(segment);

    _workoutStateHolder
        .update(_workoutStateHolder.state.copyWith(segments: segments));
  }

  void finishSegment({
    DateTime? endAt,
  }) {
    final workout = _workoutStateHolder.state;

    final workoutSegments = workout.segments;

    _workoutStateHolder.update(
      workout.copyWith(
        segments: [
          if (workoutSegments.isNotEmpty) ...[
            ...workoutSegments.sublist(0, workoutSegments.length - 1),
            workoutSegments.last.copyWith(endAt: endAt ?? DateTime.now()),
          ] else
            ...workoutSegments
        ],
      ),
    );
  }
}
