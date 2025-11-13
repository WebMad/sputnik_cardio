import 'package:sputnik_cardio/src/features/workout_core/workout_core.dart';

class PaceCalculator {
  const PaceCalculator();

  Duration calcPace(double kms, Workout workout) {
    final segments = workout.segments
        .where((segment) => WorkoutSegment.activeTypes.contains(segment.type));

    Duration duration = Duration.zero;

    for (final segment in segments) {
      final endAt = segment.endAt ?? DateTime.now();
      duration = duration + endAt.difference(segment.startAt);
    }

    if (kms == 0) {
      return Duration.zero;
    }

    // Calculate time per kilometer with millisecond precision
    final totalMilliseconds = duration.inMilliseconds;
    final millisecondsPerKm = (totalMilliseconds / kms).round();

    return Duration(milliseconds: millisecondsPerKm);
  }
}
