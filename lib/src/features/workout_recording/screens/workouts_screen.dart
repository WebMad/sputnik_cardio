import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_models/pending_workout.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/detailed_workout.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/workouts_list_data.dart';
import 'package:sputnik_cardio/src/features/workout_recording/state_holders/pending_workouts_state_holder.dart';
import 'package:sputnik_cardio/src/features/workout_recording/workout_deps_node.dart';
import 'package:sputnik_localization/sputnik_localization.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';

import '../widgets/pending_workouts_card.dart';
import '../widgets/workout_card.dart';
import 'pending_workouts_screen.dart';

class WorkoutsScreen extends StatefulWidget {
  const WorkoutsScreen({super.key});

  @override
  State<WorkoutsScreen> createState() => _WorkoutsScreenState();
}

class _WorkoutsScreenState extends State<WorkoutsScreen> {
  late WorkoutDepsNode _workoutDepsNode;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _workoutDepsNode = DepsNodeBinder.of<WorkoutDepsNode>(context);
    _workoutDepsNode.workoutListManager().load();

    _scrollController = ScrollController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    if (mounted && _scrollController.position.extentAfter < 500) {
      _workoutDepsNode.workoutListManager().handleAtEdge();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final workoutListManager = _workoutDepsNode.workoutListManager();
    final workoutsListStateHolder = _workoutDepsNode.workoutsListStateHolder();

    return SpukiScaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => workoutListManager.refresh(),
          child: StreamBuilder<WorkoutsListData?>(
            initialData: workoutsListStateHolder.state,
            stream: workoutsListStateHolder.stream,
            builder: (context, snapshot) {
              final workouts = snapshot.data?.dataOrNull?.workouts;

              if (workouts == null) {
                return Center(
                  child: SpukiText(context.tr.workoutListLoading),
                );
              }

              return Column(
                children: [
                  const PendingWorkoutsCard(),
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
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
