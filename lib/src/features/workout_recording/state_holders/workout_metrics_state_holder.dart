import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/workout_metrics.dart';

class WorkoutMetricsStateHolder extends StateHolder<WorkoutMetrics> {
  WorkoutMetricsStateHolder() : super(const WorkoutMetrics(kms: 0, avgSpeed: 0));

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
}
