import 'package:sputnik_cardio/src/features/workout_managing/models/workout_segment.dart';
import 'package:uuid/uuid.dart';

import '../models/workout.dart';

class WorkoutManager {
  final Uuid uuid;

  WorkoutManager(this.uuid);

  Workout create() {
    final workoutUuid = uuid.v4();
    return Workout(
      uuid: workoutUuid,
      state: WorkoutState.idle,
      segments: [],
    );
  }

  Workout addSegment({
    required Workout workout,
    required WorkoutSegment segment,
  }) {
    final segments = [...workout.segments];

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
