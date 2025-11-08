import 'package:sputnik_cardio/src/features/workout_core/workout_core.dart';

class AvgSpeedCalculator {
  const AvgSpeedCalculator();

  double calcSpeed(double kms, Workout workout) {
    final segments = workout.segments
        .where((segment) => WorkoutSegment.activeTypes.contains(segment.type));

    Duration duration = Duration.zero;

    for (final segment in segments) {
      final endAt = segment.endAt ?? DateTime.now();

      duration = duration + endAt.difference(segment.startAt);
    }

    final hours = duration.inSeconds / 60 / 60;

    if (hours == 0) {
      return 0;
    }

    return kms / hours;
  }
}
