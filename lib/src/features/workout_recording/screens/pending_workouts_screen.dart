import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_metrics/models/done_workout_metrics.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_models/pending_workout.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/pending_workout_save_state.dart';
import 'package:sputnik_cardio/src/features/workout_recording/state_holders/pending_workouts_save_state_holder.dart';
import 'package:sputnik_cardio/src/features/workout_recording/widgets/workout_card.dart';
import 'package:sputnik_cardio/src/features/workout_recording/workout_deps_node.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';

import '../models/detailed_workout.dart';
import '../state_holders/pending_workouts_state_holder.dart';

class PendingWorkoutsScreen extends StatelessWidget {
  static const routeName = 'pending_workouts_screen';

  const PendingWorkoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final workoutDepsNode = context.depsNode<WorkoutDepsNode>();

    final pendingWorkoutsStateHolder =
        workoutDepsNode.pendingWorkoutsStateHolder();
    final pendingWorkoutSaveStateHolder =
        workoutDepsNode.pendingWorkoutSaveStateHolder();

    final pendingWorkoutsManager = workoutDepsNode.pendingWorkoutsManager();

    return StateHolderBuilder<PendingWorkoutsSaveStateHolder,
            PendingWorkoutSaveState>(
        holder: pendingWorkoutSaveStateHolder,
        builder: (context, pendingWorkoutSaveState) {
          return SpukiScaffold(
            appBar: AppBar(
              title: const Text('Несохраненные тренировки'),
              actions: [
                pendingWorkoutSaveState.map(
                  idle: (_) => IconButton(
                    icon: const Icon(Icons.sync),
                    onPressed: () => pendingWorkoutsManager.syncWorkouts(),
                  ),
                  saving: (_) => const CircularProgressIndicator(),
                ),
              ],
            ),
            body: StateHolderBuilder<PendingWorkoutsStateHolder,
                List<PendingWorkout>>(
              holder: pendingWorkoutsStateHolder,
              builder: (context, state) {
                if (state.isEmpty) {
                  return const Center(
                    child: Text('Нет несохраненных тренировок'),
                  );
                }

                return ListView.builder(
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    final pendingWorkout = state[index];
                    final metrics = pendingWorkout.workoutMetrics;

                    return WorkoutCard(
                      isInteractive: false,
                      detailedWorkout: DetailedWorkout(
                        workout: pendingWorkout.workout,
                        metrics: DoneWorkoutMetrics(
                          pace: metrics.pace,
                          kms: metrics.kms,
                          avgSpeed: metrics.avgSpeed,
                          duration: metrics.duration,
                        ),
                        routes: Map.fromEntries(
                          pendingWorkout.routes.map(
                            (e) => MapEntry(e.uuid, e.routeData),
                          ),
                        ),
                      ),
                      trailing: PopupMenuButton<int>(
                        icon: const Icon(
                          Icons.more_vert,
                          size: 30,
                        ),
                        initialValue: -1,
                        onSelected: (int item) {
                          if (item == 0) {
                            pendingWorkoutsManager.removeWorkout(
                              pendingWorkout.workout.uuid,
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
                    );
                  },
                );
              },
            ),
          );
        });
  }
}
