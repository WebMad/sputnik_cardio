import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_metrics/models/workout_metrics.dart';

class WorkoutMetricsStateHolder extends StateHolder<WorkoutMetrics> {
  WorkoutMetricsStateHolder()
      : super(
          const WorkoutMetrics(
            kms: 0,
            avgSpeed: 0,
            speed: 0,
            duration: Duration.zero,
            pace: Duration.zero,
            paceLastKm: Duration.zero,
          ),
        );

  void update(WorkoutMetrics metrics) {
    state = metrics;
  }

  void updateDuration(Duration duration) {
    state = state.copyWith(
      duration: duration,
    );
  }
}
