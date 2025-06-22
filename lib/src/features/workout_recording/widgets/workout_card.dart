import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:intl/intl.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/detailed_workout.dart';
import 'package:sputnik_cardio/src/features/workout_recording/workout_deps_node.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';

import '../screens/workout_info_screen.dart';
import '../workout_info_screen_deps_node.dart';

class WorkoutCard extends StatelessWidget {
  final DetailedWorkout detailedWorkout;
  final bool isInteractive;
  final Widget? trailing;

  const WorkoutCard({
    super.key,
    required this.detailedWorkout,
    this.isInteractive = true,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final workoutDepsNode = context.depsNode<WorkoutDepsNode>();

    final workoutListManager = workoutDepsNode.workoutListManager();

    final workout = detailedWorkout.workout;

    final startAt = workout.startAt;

    final metrics = detailedWorkout.metrics;

    return InkWell(
      onTap: isInteractive ? () => _openWorkoutScreen(context) : null,
      child: Column(
        key: ValueKey(workout.uuid),
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: SpukiTheme.of(context).puk(2),
              horizontal: SpukiTheme.of(context).puk(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(
                      builder: (context) {
                        final startAtHour = workout.startAt.hour;

                        if (startAtHour < 6) {
                          return const SpukiText(
                            'Ночная тренировка',
                            spukiFontType: SpukiFontType.h3,
                          );
                        } else if (startAtHour < 12) {
                          return const SpukiText(
                            'Утренняя тренировка',
                            spukiFontType: SpukiFontType.h3,
                          );
                        } else if (startAtHour < 18) {
                          return const SpukiText(
                            'Дневная тренировка',
                            spukiFontType: SpukiFontType.h3,
                          );
                        }

                        return const SpukiText(
                          'Вечерняя тренировка',
                          spukiFontType: SpukiFontType.h3,
                        );
                      },
                    ),
                    trailing ??
                        PopupMenuButton<int>(
                          icon: const Icon(
                            Icons.more_vert,
                            size: 30,
                          ),
                          initialValue: -1,
                          onSelected: (int item) {
                            if (item == 0) {
                              workoutListManager.removeWorkout(
                                workout.uuid,
                              );
                            }
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<int>>[
                            const PopupMenuItem<int>(
                              value: 0,
                              child: Text('Remove'),
                            ),
                          ],
                        ),
                  ],
                ),
                if (metrics != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const SpukiText('Длительность'),
                            SpukiText(
                              _formatTime(metrics.duration),
                              spukiFontType: SpukiFontType.h3,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const SpukiText('Расстояние'),
                            SpukiText(
                              '${metrics.kms.toStringAsFixed(2)} км',
                              spukiFontType: SpukiFontType.h3,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const SpukiText('Темп'),
                            SpukiText(
                              _formatTime(metrics.pace),
                              spukiFontType: SpukiFontType.h3,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SpukiText(
                      DateFormat('HH:mm dd.MM.yyyy').format(startAt),
                    ),
                    SpukiButton(
                      onPressed: () => _openWorkoutScreen(context),
                      child: const SpukiText('Подробнее'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }

  void _openWorkoutScreen(BuildContext context) {
    final workoutDepsNode = context.depsNode<WorkoutDepsNode>();

    final workoutScreenDepsNode =
        workoutDepsNode.workoutInfoScreenDepsNode(detailedWorkout);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DepsNodeBinder<WorkoutInfoScreenDepsNode>.value(
          depsNode: workoutScreenDepsNode,
          child: const WorkoutInfoScreen(),
        ),
      ),
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
