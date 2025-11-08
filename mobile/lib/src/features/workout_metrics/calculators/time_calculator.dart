import 'package:sputnik_cardio/src/features/workout_core/workout_core.dart';

class TimeCalculator {
  Duration calcTime(Workout workout) {
    if (workout.segments.isEmpty) {
      return Duration.zero;
    }

    Duration duration = Duration.zero;

    final activeSegments = workout.segments.where(
      (segment) => WorkoutSegment.activeTypes.contains(segment.type),
    );

    for (final segment in activeSegments) {
      final endTime = segment.endAt ?? DateTime.now();
      duration += endTime.difference(segment.startAt);
    }

    return duration;
  }
}
