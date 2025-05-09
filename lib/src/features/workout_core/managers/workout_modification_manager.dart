import 'package:uuid/uuid.dart';

import '../models/workout.dart';
import '../models/workout_segment.dart';

class WorkoutModificationManager {
  final Uuid uuid;

  WorkoutModificationManager(this.uuid);

  Workout create() {
    final workoutUuid = uuid.v4();
    return Workout(
      uuid: workoutUuid,
      state: WorkoutState.idle,
      segments: [],
      startAt: DateTime.now(),
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
