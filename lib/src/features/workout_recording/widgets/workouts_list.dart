import 'package:flutter/material.dart';
import '../models/workouts_screen_state.dart';
import '../widgets/pending_workouts_card.dart';
import '../widgets/workout_card.dart';

class WorkoutsList extends StatelessWidget {
  final WorkoutsScreenState state;
  final ScrollController scrollController;

  const WorkoutsList({
    super.key,
    required this.state,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PendingWorkoutsCard(),
        Expanded(
          child: ListView.builder(
            controller: scrollController,
            itemCount: state.workouts.length,
            itemBuilder: (context, index) => WorkoutCard(
              detailedWorkout: state.workouts[index],
            ),
          ),
        ),
      ],
    );
  }
}