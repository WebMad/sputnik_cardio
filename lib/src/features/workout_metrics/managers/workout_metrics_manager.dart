import 'dart:async';

import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sputnik_cardio/src/features/workout_core/workout_core.dart';
import 'package:sputnik_cardio/src/features/workout_recording/metrics_calculators/avg_speed_calculator.dart';
import 'package:sputnik_cardio/src/features/workout_recording/metrics_calculators/km_metric_calculator.dart';
import 'package:sputnik_cardio/src/features/workout_recording/metrics_calculators/speed_calculator.dart';
import 'package:sputnik_cardio/src/features/workout_recording/metrics_calculators/time_calculator.dart';
import 'package:sputnik_cardio/src/features/workout_track/providers/workout_track_provider.dart';
import 'package:sputnik_cardio/src/features/workout_recording/state_holders/workout_metrics_state_holder.dart';
import 'package:sputnik_cardio/src/features/workout_recording/state_holders/workout_state_holder.dart';

class WorkoutMetricsManager implements Lifecycle {
  final PersistentWorkoutStateHolder _workoutStateHolder;
  final WorkoutTrackProvider Function(String routeUuid)
      _workoutTrackProviderFactory;
  final KmMetricCalculator _kmMetricCalculator;
  final AvgSpeedCalculator _avgSpeedCalculator;
  final SpeedCalculator _speedCalculator;
  final TimeCalculator _timeCalculator;
  final WorkoutMetricsStateHolder _workoutMetricsStateHolder;

  StreamSubscription<Workout?>? _sub;

  Timer? _durationTimer;

  WorkoutMetricsManager(
    this._workoutStateHolder,
    this._workoutTrackProviderFactory,
    this._kmMetricCalculator,
    this._workoutMetricsStateHolder,
    this._avgSpeedCalculator,
    this._speedCalculator,
    this._timeCalculator,
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

    _durationTimer = Timer.periodic(
      const Duration(milliseconds: 500),
      (_) => _handleUpdateTimer(),
    );
  }

  void _handleUpdateTimer() {
    final workout = _workoutStateHolder.state;

    if (workout == null) {
      return;
    }

    final duration = _timeCalculator.calcTime(workout);
    _workoutMetricsStateHolder.updateDuration(duration);
  }

  void _handleLocation(Workout? workout) {
    if (workout == null) {
      _workoutMetricsStateHolder.updateKms(0);
      _workoutMetricsStateHolder.updateSpeed(0);
      _workoutMetricsStateHolder.updateAvgSpeed(0);
      _workoutMetricsStateHolder.updateDuration(Duration.zero);
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
    _durationTimer?.cancel();
    _durationTimer = null;
    await _sub?.cancel();
    _sub = null;
  }
}
