import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/workout_metrics.dart';

class WorkoutMetricsStateHolder extends StateHolder<WorkoutMetrics> {
  WorkoutMetricsStateHolder()
      : super(
          const WorkoutMetrics(
            kms: 0,
            avgSpeed: 0,
            speed: 0,
            duration: Duration.zero,
          ),
        );

  void updateKms(double kms) {
    state = state.copyWith(
      kms: kms,
    );
  }

  void updateAvgSpeed(double avgSpeed) {
    state = state.copyWith(
      avgSpeed: avgSpeed,
    );
  }

  void updateSpeed(double speed) {
    state = state.copyWith(
      speed: speed,
    );
  }

  void updateDuration(Duration duration) {
    state = state.copyWith(
      duration: duration,
    );
  }
}
