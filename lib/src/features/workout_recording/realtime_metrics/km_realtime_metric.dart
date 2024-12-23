import 'package:flutter/src/widgets/framework.dart';
import 'package:sputnik_cardio/src/features/tracking/models/extended_pos.dart';
import 'package:sputnik_cardio/src/features/workout_recording/realtime_metrics/realtime_metric.dart';

class KmRealtimeMetricCalculator
    extends RealtimeMetricCalculator<KmRealtimeMetric> {
  ExtendedPos? _previousPos;

  KmRealtimeMetricCalculator() : super(KmRealtimeMetric(0));

  @override
  void handlePos(ExtendedPos pos) {
    final previousPos = _previousPos;

    if (previousPos == null) {
      _previousPos = pos;
      return;
    }

    final distance = previousPos.distanceTo(pos);

    _previousPos = pos;

    update(KmRealtimeMetric(metric.kms + distance));
  }
}

class KmRealtimeMetric implements RealtimeMetric {
  final double kms;

  KmRealtimeMetric(this.kms);

  @override
  String toView(BuildContext context) {
    return '${kms.toStringAsFixed(2)} km';
  }
}
