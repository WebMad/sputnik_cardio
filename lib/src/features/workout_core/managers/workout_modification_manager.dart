import 'package:sputnik_cardio/src/features/workout_core/factories/workout_factory.dart';
import 'package:sputnik_cardio/src/features/workout_core/factories/workout_segment_factory.dart';
import 'package:uuid/uuid.dart';

import '../models/workout.dart';
import '../models/workout_segment.dart';

class WorkoutModificationManager {
  final WorkoutSegmentFactory _workoutSegmentFactory;
  final WorkoutFactory _workoutFactory;
  final Uuid uuid;

  WorkoutModificationManager(
    this.uuid,
    this._workoutSegmentFactory,
    this._workoutFactory,
  );

  Workout start() =>
      _workoutFactory.create().copyWith(state: WorkoutState.inProcess);

  Workout pause(
    Workout workout, [
    DateTime? startAt,
  ]) =>
      addSegment(
        workout: workout.copyWith(
          state: WorkoutState.paused,
        ),
        segmentType: WorkoutSegmentType.pause,
        startAt: startAt,
      );

  Workout stop(Workout workout) => finishSegment(workout: workout).copyWith(
        stopAt: DateTime.now(),
        state: WorkoutState.stopped,
      );

  Workout resume(Workout workout) => addSegment(
        workout: workout.copyWith(state: WorkoutState.inProcess),
        segmentType: WorkoutSegmentType.run,
      );

  Workout addSegment({
    required Workout workout,
    required WorkoutSegmentType segmentType,
    DateTime? startAt,
  }) {
    final segments = [...workout.segments];

    final segment = _workoutSegmentFactory.create(
      segmentType,
      uuid.v4(),
      startAt,
    );

    if (segments.isNotEmpty) {
      final lastSegment = segments.removeLast().copyWith(
            endAt: segment.startAt,
          );

      segments.add(lastSegment);
    }

    segments.add(segment);

    return workout.copyWith(segments: segments);
  }

  Workout finishSegment({
    required Workout workout,
  }) =>
      workout.copyWith(
        segments: [
          if (workout.segments.isNotEmpty) ...[
            ...workout.segments.sublist(0, workout.segments.length - 1),
            workout.segments.last.copyWith(endAt: DateTime.now()),
          ] else
            ...workout.segments
        ],
      );
}
