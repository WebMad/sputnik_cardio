import 'dart:async';

import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sputnik_cardio/src/features/workout_core/workout_core.dart';
import 'package:sputnik_cardio/src/features/workout_metrics/calculators/last_km_pace_calculator.dart';
import 'package:sputnik_cardio/src/features/workout_metrics/calculators/pace_calculator.dart';
import 'package:sputnik_cardio/src/features/workout_metrics/state_holders/workout_metrics_state_holder.dart';
import 'package:sputnik_cardio/src/features/workout_recording/state_holders/workout_state_holder.dart';
import 'package:sputnik_cardio/src/features/workout_track/workout_track_deps_node.dart';

import '../calculators/avg_speed_calculator.dart';
import '../calculators/km_metric_calculator.dart';
import '../calculators/speed_calculator.dart';
import '../calculators/time_calculator.dart';

class WorkoutMetricsManager implements Lifecycle {
  final PersistentWorkoutStateHolder _workoutStateHolder;
  final WorkoutTrackDepsNode _workoutTrackDepsNode;
  final KmMetricCalculator _kmMetricCalculator;
  final AvgSpeedCalculator _avgSpeedCalculator;
  final SpeedCalculator _speedCalculator;
  final TimeCalculator _timeCalculator;
  final PaceCalculator _paceCalculator;
  final LastKmPaceCalculator _lastKmPaceCalculator;
  final WorkoutMetricsStateHolder _workoutMetricsStateHolder;

  StreamSubscription<Workout?>? _sub;

  Timer? _durationTimer;

  WorkoutMetricsManager(
    this._workoutStateHolder,
    this._workoutTrackDepsNode,
    this._kmMetricCalculator,
    this._workoutMetricsStateHolder,
    this._avgSpeedCalculator,
    this._speedCalculator,
    this._timeCalculator,
    this._paceCalculator,
    this._lastKmPaceCalculator,
  );

  @override
  Future<void> init() async {
    _sub = _workoutStateHolder.asStream
        .switchMap((workout) {
          final lastSegment = workout?.lastSegment;

          if (workout == null || lastSegment == null) {
            return Stream.value(null);
          }

          return _workoutTrackDepsNode
              .trackProvider(lastSegment.routeUuid)
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
      _workoutMetricsStateHolder.update(
        _workoutMetricsStateHolder.state.copyWith(
          kms: 0,
          avgSpeed: 0,
          duration: Duration.zero,
          pace: Duration.zero,
          paceLastKm: Duration.zero,
          speed: 0,
        ),
      );
      return;
    }

    final kms = _kmMetricCalculator.calcDistanceForWorkout(workout);
    final avgSpeed = _avgSpeedCalculator.calcSpeed(kms, workout);
    final speed = _speedCalculator.calcSpeed(workout);
    final pace = _paceCalculator.calcPace(kms, workout);
    final paceLastKm = _lastKmPaceCalculator.calcPace(workout);

    _workoutMetricsStateHolder.update(
      _workoutMetricsStateHolder.state.copyWith(
        kms: kms,
        avgSpeed: avgSpeed,
        pace: pace,
        paceLastKm: paceLastKm,
        speed: speed,
      ),
    );
  }

  @override
  Future<void> dispose() async {
    _durationTimer?.cancel();
    _durationTimer = null;
    await _sub?.cancel();
    _sub = null;
  }
}
