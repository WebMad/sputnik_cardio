import 'dart:async';

import 'package:flutter/src/widgets/framework.dart';
import 'package:sputnik_cardio/src/features/tracking/models/extended_pos.dart';
import 'package:sputnik_cardio/src/features/workout_recording/realtime_metrics/realtime_metric.dart';

class SpeedRealtimeMetricCalculator
    extends RealtimeMetricCalculator<SpeedRealtimeMetric> {
  ExtendedPos? _previousPos;

  SpeedRealtimeMetricCalculator() : super(SpeedRealtimeMetric(0));

  @override
  void handlePos(ExtendedPos pos) {
    final previousPos = _previousPos;
    if (previousPos == null) {
      _previousPos = pos;
      return;
    }

    final distance = pos.distanceTo(previousPos);

    final timeInHours =
        (pos.fetchedAt.difference(previousPos.fetchedAt).inSeconds / (60 * 60));

    _previousPos = pos;

    update(
      SpeedRealtimeMetric(
        distance / timeInHours,
      ),
    );
  }
}

class SpeedRealtimeMetric implements RealtimeMetric {
  final double speed;

  SpeedRealtimeMetric(this.speed);

  @override
  String toView(BuildContext context) {
    return '${speed.toStringAsFixed(2)} km/h';
  }
}
