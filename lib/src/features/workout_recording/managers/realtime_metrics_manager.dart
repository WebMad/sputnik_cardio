import 'dart:async';

import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sputnik_cardio/src/features/tracking/models/extended_pos.dart';
import 'package:sputnik_cardio/src/features/workout_recording/realtime_metrics/realtime_metric.dart';

import '../../tracking/managers/location_manager.dart';

class RealtimeMetricsManager implements Lifecycle {
  final List<RealtimeMetricCalculator> _realtimeMetricCalculators;
  final LocationManager _locationManager;

  StreamSubscription<ExtendedPos>? _sub;

  RealtimeMetricsManager(
    this._realtimeMetricCalculators,
    this._locationManager,
  );

  @override
  Future<void> init() async {
    _sub = _locationManager.locationStream.listen(
      (pos) => _handleLocation(pos),
    );
  }

  List<RealtimeMetric> get metrics => _realtimeMetricCalculators
      .map((realtimeMetricCalculator) => realtimeMetricCalculator.metric)
      .toList();

  Stream<List<RealtimeMetric>> get metricsStream => Rx.combineLatest(
        _realtimeMetricCalculators.map(
          (realtimeMetricCalculator) => realtimeMetricCalculator.metricStream,
        ),
        (values) => values,
      );

  void _handleLocation(ExtendedPos pos) {
    for (final realtimeMetricCalculator in _realtimeMetricCalculators) {
      realtimeMetricCalculator.handlePos(pos);
    }
  }

  @override
  Future<void> dispose() async {
    await _sub?.cancel();
    _sub = null;
  }
}
