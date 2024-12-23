import 'package:flutter/cupertino.dart';
import 'package:sputnik_cardio/src/features/workout_recording/realtime_metrics/realtime_metric.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';

class RealtimeMetricCard extends StatelessWidget {
  final RealtimeMetric realtimeMetric;

  const RealtimeMetricCard({
    super.key,
    required this.realtimeMetric,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Center(
        child: SpukiText(
          realtimeMetric.toView(context),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
