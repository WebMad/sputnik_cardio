import 'dart:async';

import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sputnik_cardio/src/features/workout_managing/models/workout.dart';
import 'package:sputnik_cardio/src/features/workout_recording/metrics_calculators/avg_speed_calculator.dart';
import 'package:sputnik_cardio/src/features/workout_recording/metrics_calculators/km_metric_calculator.dart';
import 'package:sputnik_cardio/src/features/workout_recording/metrics_calculators/speed_calculator.dart';
import 'package:sputnik_cardio/src/features/workout_recording/providers/workout_track_provider.dart';
import 'package:sputnik_cardio/src/features/workout_recording/state_holders/workout_metrics_state_holder.dart';
import 'package:sputnik_cardio/src/features/workout_recording/state_holders/workout_state_holder.dart';

class WorkoutMetricsManager implements Lifecycle {
  final WorkoutStateHolder _workoutStateHolder;
  final WorkoutTrackProvider Function(String routeUuid)
      _workoutTrackProviderFactory;
  final KmMetricCalculator _kmMetricCalculator;
  final AvgSpeedCalculator _avgSpeedCalculator;
  final SpeedCalculator _speedCalculator;
  final WorkoutMetricsStateHolder _workoutMetricsStateHolder;

  StreamSubscription<Workout?>? _sub;

  WorkoutMetricsManager(
    this._workoutStateHolder,
    this._workoutTrackProviderFactory,
    this._kmMetricCalculator,
    this._workoutMetricsStateHolder,
    this._avgSpeedCalculator,
    this._speedCalculator,
  );

  @override
  Future<void> init() async {
    _sub = _workoutStateHolder.asStream
        .switchMap((workout) {
          final lastSegment = workout?.lastSegment;

          if (workout == null || lastSegment == null) {
            return Stream.value(null);
          }

          return _workoutTrackProviderFactory(lastSegment.routeUuid)
              .trackStream;
        })
        .map((_) => _workoutStateHolder.state)
        .listen((workout) => _handleLocation(workout));
  }

  void _handleLocation(Workout? workout) {
    if (workout == null) {
      _workoutMetricsStateHolder.updateKms(0);
      _workoutMetricsStateHolder.updateSpeed(0);
      _workoutMetricsStateHolder.updateAvgSpeed(0);
      return;
    }

    final kms = _kmMetricCalculator.calcDistanceForWorkout(workout);

    _workoutMetricsStateHolder.updateKms(kms);

    final avgSpeed = _avgSpeedCalculator.calcSpeed(kms, workout);
    _workoutMetricsStateHolder.updateAvgSpeed(avgSpeed);

    final speed = _speedCalculator.calcSpeed(workout);
    _workoutMetricsStateHolder.updateSpeed(speed);
  }

  @override
  Future<void> dispose() async {
    await _sub?.cancel();
    _sub = null;
  }
}
