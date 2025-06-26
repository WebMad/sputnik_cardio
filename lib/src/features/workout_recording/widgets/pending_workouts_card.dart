import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_recording/workout_deps_node.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';

import '../data/data_models/pending_workout.dart';
import '../screens/pending_workouts_screen.dart';
import '../state_holders/pending_workouts_state_holder.dart';

class PendingWorkoutsCard extends StatelessWidget {
  const PendingWorkoutsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final pendingWorkoutsStateHolder =
        context.depsNode<WorkoutDepsNode>().pendingWorkoutsStateHolder();

    return StateHolderBuilder<PendingWorkoutsStateHolder, List<PendingWorkout>>(
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
    );
  }
}
