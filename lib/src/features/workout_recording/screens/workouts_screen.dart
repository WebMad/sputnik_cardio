import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_models/pending_workout.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/detailed_workout.dart';
import 'package:sputnik_cardio/src/features/workout_recording/state_holders/pending_workouts_state_holder.dart';
import 'package:sputnik_cardio/src/features/workout_recording/workout_deps_node.dart';
import 'package:sputnik_localization/sputnik_localization.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';

import '../widgets/workout_card.dart';
import 'pending_workouts_screen.dart';

class WorkoutsScreen extends StatefulWidget {
  const WorkoutsScreen({super.key});

  @override
  State<WorkoutsScreen> createState() => _WorkoutsScreenState();
}

class _WorkoutsScreenState extends State<WorkoutsScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    DepsNodeBinder.of<WorkoutDepsNode>(context).workoutListManager().load();
  }

  @override
  Widget build(BuildContext context) {
    final workoutDepsNode = DepsNodeBinder.of<WorkoutDepsNode>(context);

    final workoutListManager = workoutDepsNode.workoutListManager();
    final workoutsListStateHolder = workoutDepsNode.workoutsListStateHolder();

    final pendingWorkoutsStateHolder =
        workoutDepsNode.pendingWorkoutsStateHolder();

    return SpukiScaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => workoutListManager.load(),
          child: StreamBuilder<List<DetailedWorkout>?>(
            initialData: workoutsListStateHolder.state,
            stream: workoutsListStateHolder.stream,
            builder: (context, snapshot) {
              final workouts = snapshot.data;

              if (workouts == null) {
                return Center(
                  child: SpukiText(context.tr.workoutListLoading),
                );
              }

              return Column(
                children: [
                  StateHolderBuilder<PendingWorkoutsStateHolder,
                      List<PendingWorkout>>(
                    holder: pendingWorkoutsStateHolder,
                    builder: (context, state) {
                      if (state.isEmpty) {
                        return const SizedBox.shrink();
                      }

                      return GestureDetector(
                        onTap: () => Navigator.of(context).pushNamed(
                          PendingWorkoutsScreen.routeName,
                        ),
                        child: ColoredBox(
                          color: Colors.grey,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SpukiText(
                                  'Pending workouts: ${state.length}',
                                  color: Colors.black,
                                ),
                                const Icon(
                                  Icons.chevron_right,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: workouts.length,
                      itemBuilder: (context, index) => WorkoutCard(
                        detailedWorkout: workouts[index],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
