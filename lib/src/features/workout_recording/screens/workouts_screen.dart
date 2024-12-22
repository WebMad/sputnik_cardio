import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/workout.dart';
import 'package:sputnik_cardio/src/features/workout_recording/workout_lifecycle_deps_node.dart';
import 'package:sputnik_localization/sputnik_localization.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';

class WorkoutsScreen extends StatefulWidget {
  const WorkoutsScreen({super.key});

  @override
  State<WorkoutsScreen> createState() => _WorkoutsScreenState();
}

class _WorkoutsScreenState extends State<WorkoutsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    DepsNodeBinder.of<WorkoutLifecycleDepsNode>(context)
        .workoutListManager
        .load();
  }

  @override
  Widget build(BuildContext context) {
    final workoutLifecycleDepsNode =
        DepsNodeBinder.of<WorkoutLifecycleDepsNode>(context);
    final workoutsListStateHolder =
        workoutLifecycleDepsNode.workoutsListStateHolder;

    return SpukiScaffold(
      body: SafeArea(
        child: StreamBuilder<List<Workout>?>(
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
                itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.only(
                    bottom: SpukiTheme.of(context).puk(4),
                  ),
                  child: Column(
                    children: [
                      const SpukiText.h2('Тренировка'),
                      SpukiText(workouts[index].startAt.toString()),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
