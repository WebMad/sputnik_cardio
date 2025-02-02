import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_recording/realtime_metrics/realtime_metric.dart';
import 'package:sputnik_cardio/src/features/workout_recording/realtime_metrics_deps_node.dart';
import 'package:sputnik_cardio/src/features/workout_recording/widgets/realtime_metric_card.dart';

class RealtimeMetricsView extends StatelessWidget {
  const RealtimeMetricsView({super.key});

  @override
  Widget build(BuildContext context) {
    final realtimeMetricsManager =
        DepsNodeBinder.of<RealtimeMetricsDepsNode>(context)
            .realtimeMetricsManager();

    return SafeArea(
      child: StreamBuilder<List<RealtimeMetric>>(
        initialData: realtimeMetricsManager.metrics,
        stream: realtimeMetricsManager.metricsStream,
        builder: (context, snapshot) {
          final metrics = snapshot.requireData;

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < metrics.length + metrics.length % 2; i += 2)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RealtimeMetricCard(realtimeMetric: metrics[i]),
                    if (i + 1 < metrics.length)
                      RealtimeMetricCard(realtimeMetric: metrics[i + 1]),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}
