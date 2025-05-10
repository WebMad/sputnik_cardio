import 'package:sputnik_cardio/src/features/workout_core/factories/workout_factory.dart';
import 'package:sputnik_cardio/src/features/workout_core/factories/workout_segment_factory.dart';
import 'package:sputnik_cardio/src/features/workout_core/providers/workout_provider.dart';
import 'package:uuid/uuid.dart';

import '../models/workout.dart';
import '../models/workout_segment.dart';

class WorkoutModificationManager {
  final WorkoutSegmentFactory _workoutSegmentFactory;
  final WorkoutFactory _workoutFactory;
  final Uuid uuid;
  final WorkoutProvider _workoutProvider;

  const WorkoutModificationManager(
    this.uuid,
    this._workoutSegmentFactory,
    this._workoutFactory,
    this._workoutProvider,
  );

  void start() => _workoutProvider.update(
        _workoutFactory.create().copyWith(state: WorkoutState.inProcess),
      );

  void pause([
    DateTime? startAt,
  ]) {
    _workoutProvider.update(
      _workoutProvider.workout!.copyWith(state: WorkoutState.paused),
    );

    addSegment(
      segmentType: WorkoutSegmentType.pause,
      startAt: startAt,
    );
  }

  void stop() {
    _workoutProvider.update(
      _workoutProvider.workout!.copyWith(
        stopAt: DateTime.now(),
        state: WorkoutState.stopped,
      ),
    );
    finishSegment();
  }

  void resume() {
    _workoutProvider.update(
      _workoutProvider.workout!.copyWith(state: WorkoutState.inProcess),
    );
    addSegment(segmentType: WorkoutSegmentType.run);
  }

  void addSegment({
    required WorkoutSegmentType segmentType,
    DateTime? startAt,
  }) {
    final segments = [..._workoutProvider.workout!.segments];

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

    _workoutProvider
        .update(_workoutProvider.workout!.copyWith(segments: segments));
  }

  void finishSegment({
    DateTime? endAt,
  }) {
    final workout = _workoutProvider.workout!;

    final workoutSegments = workout.segments;

    _workoutProvider.update(
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
