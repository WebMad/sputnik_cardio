import 'dart:async';

import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/tracking/tracking_deps_node.dart';

import 'managers/realtime_metrics_manager.dart';
import 'realtime_metrics/speed_realtime_metric.dart';

class RealtimeMetricsDepsNode extends DepsNodeWithLifecycle {
  final LocationDepsNode _locationDepsNode;

  RealtimeMetricsDepsNode(this._locationDepsNode);

  late final realtimeMetricsManager = bind(
    () => RealtimeMetricsManager(
      [
        _speedRealtimeMetricCalculator,
      ],
      _locationDepsNode.locationManager,
    ),
  );

  late final _speedRealtimeMetricCalculator = bind(
    () => SpeedRealtimeMetricCalculator(),
  );

  @override
  FutureOr<void> init() async {
    await _speedRealtimeMetricCalculator.init();

    await realtimeMetricsManager.init();
    super.init();
  }

  @override
  FutureOr<void> dispose() async {
    super.dispose();

    await realtimeMetricsManager.dispose();

    await _speedRealtimeMetricCalculator.dispose();
  }
}
