import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_recording/workout_deps_node.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';

import '../models/workout_metrics.dart';

class ActiveWorkoutMetrics extends StatelessWidget {
  const ActiveWorkoutMetrics({super.key});

  @override
  Widget build(BuildContext context) {
    final workoutDepsNode = context.depsNode<WorkoutDepsNode>();

    final workoutMetricsStateHolder =
        workoutDepsNode.workoutMetricsStateHolder();

    return StreamBuilder<WorkoutMetrics>(
      initialData: workoutMetricsStateHolder.state,
      stream: workoutMetricsStateHolder.stream,
      builder: (context, snapshot) {
        final metrics = snapshot.requireData;

        return Column(
          children: [
            const SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpukiText(
                  _formatTime(metrics.duration),
                  spukiFontType: SpukiFontType.h2,
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  // width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 5),
                      const SpukiText('Расстояние'),
                      SpukiText(
                        "${metrics.kms.toStringAsFixed(2)} км",
                        spukiFontType: SpukiFontType.h3,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 5),
                      const SpukiText('Средняя скорость'),
                      SpukiText(
                        "${metrics.avgSpeed.toStringAsFixed(2)} км/ч",
                        spukiFontType: SpukiFontType.h3,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 5),
                      const SpukiText('Скорость'),
                      SpukiText(
                        "${metrics.speed.toStringAsFixed(2)} км/ч",
                        spukiFontType: SpukiFontType.h3,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  String _formatTime(Duration duration) {
    final totalSeconds = duration.inSeconds;
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    final seconds = totalSeconds % 60;

    final hoursStr = hours > 0 ? '${hours.toString().padLeft(2, '0')}:' : '';
    final minutesStr = minutes.toString().padLeft(2, '0');
    final secondsStr = seconds.toString().padLeft(2, '0');

    return '$hoursStr$minutesStr:$secondsStr';
  }
}
