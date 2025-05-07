import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/detailed_workout.dart';
import 'package:sputnik_cardio/src/features/workout_recording/workout_deps_node.dart';
import 'package:sputnik_localization/sputnik_localization.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';

import '../widgets/workout_card.dart';

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

              return ListView.builder(
                itemCount: workouts.length,
                itemBuilder: (context, index) => WorkoutCard(
                  detailedWorkout: workouts[index],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
