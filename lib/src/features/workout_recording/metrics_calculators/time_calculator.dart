import 'package:sputnik_cardio/src/features/workout_managing/models/workout.dart';
import 'package:sputnik_cardio/src/features/workout_managing/models/workout_segment.dart';

class TimeCalculator {
  Duration calcTime(Workout workout) {
    if (workout.segments.isEmpty) {
      return Duration.zero;
    }

    final activeSegments = workout.segments.where(
      (segment) => WorkoutSegment.activeTypes.contains(segment.type),
    );

    int totalSeconds = 0;

    for (final segment in activeSegments) {
      final endTime = segment.endAt ?? DateTime.now();
      totalSeconds += endTime.difference(segment.startAt).inSeconds;
    }

    return Duration(seconds: totalSeconds);
  }
}
