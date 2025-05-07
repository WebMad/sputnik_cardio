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

  const WorkoutCard({
    super.key,
    required this.detailedWorkout,
  });

  @override
  Widget build(BuildContext context) {
    final workoutDepsNode = context.depsNode<WorkoutDepsNode>();

    final workoutListManager = workoutDepsNode.workoutListManager();

    final workout = detailedWorkout.workout;

    final startAt = workout.startAt;

    return Column(
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SpukiText.h2('Тренировка'),
                      SpukiText(
                        DateFormat('HH:mm dd.MM.yyyy').format(startAt),
                      ),
                    ],
                  ),
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        SpukiText('Расстояние'),
                        // SpukiText(
                        //   '${workout.metrics.kms.toStringAsFixed(2)} km',
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        SpukiText('Средняя скорость'),
                        // SpukiText(
                        //   '${workout.metrics.avgSpeed.toStringAsFixed(2)} km/h',
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SpukiButton(
                  onPressed: () {
                    final workoutScreenDepsNode =
                        workoutDepsNode.workoutInfoScreenDepsNode(
                      detailedWorkout,
                    );

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            DepsNodeBinder<WorkoutInfoScreenDepsNode>.value(
                          depsNode: workoutScreenDepsNode,
                          child: const WorkoutInfoScreen(),
                        ),
                      ),
                    );
                  },
                  child: const SpukiText('Подробнее'),
                ),
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
