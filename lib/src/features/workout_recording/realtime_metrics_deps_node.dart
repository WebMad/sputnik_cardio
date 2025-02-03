import 'dart:async';

import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/tracking/tracking_deps_node.dart';
import 'package:sputnik_cardio/src/features/workout_recording/realtime_metrics/km_realtime_metric.dart';

import 'managers/realtime_metrics_manager.dart';
import 'realtime_metrics/speed_realtime_metric.dart';

class RealtimeMetricsDepsNode extends DepsNode {
  final LocationDepsNode _locationDepsNode;

  RealtimeMetricsDepsNode(this._locationDepsNode);

  @override
  List<Set<LifecycleDependency>> get initializeQueue => [
        {
          _speedRealtimeMetricCalculator,
          _kmRealtimeMetricCalculator,
        },
        {
          realtimeMetricsManager,
        },
      ];

  late final realtimeMetricsManager = bind(
    () => RealtimeMetricsManager(
      [
        _speedRealtimeMetricCalculator(),
        _kmRealtimeMetricCalculator(),
      ],
      _locationDepsNode.locationManager(),
    ),
  );

  late final _speedRealtimeMetricCalculator = bind(
    () => SpeedRealtimeMetricCalculator(),
  );

  late final _kmRealtimeMetricCalculator = bind(
    () => KmRealtimeMetricCalculator(),
  );
}
