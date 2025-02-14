import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_managing/di/workout_managing_deps_node.dart';
import 'package:uuid/uuid.dart';

import '../../workout_managing/models/workout.dart';
import '../managers/active_workout_manager.dart';
import '../managers/workout_interaction_manager.dart';
import '../state_holders/active_workout_state_holder.dart';

class ActiveWorkoutDepsNode extends DepsNode {
  final Workout initialWorkout;
  final WorkoutManagingDepsNode _workoutManagingDepsNode;

  ActiveWorkoutDepsNode(
    this.initialWorkout,
    this._workoutManagingDepsNode,
  );

  late final activeWorkoutManager = bind(
    () => ActiveWorkoutManager(
      activeWorkoutStateHolder(),
      _workoutManagingDepsNode.workoutManager(),
    ),
  );

  late final activeWorkoutStateHolder = bind(
    () => ActiveWorkoutStateHolder(initialWorkout),
  );

  late final workoutInteractionManager = bind(
    () => WorkoutInteractionManager(
      activeWorkoutStateHolder(),
      _workoutManagingDepsNode.workoutManager(),
    ),
  );

  @override
  List<Set<LifecycleDependency>> get initializeQueue => [
        {
          activeWorkoutStateHolder,
        },
        {
          activeWorkoutManager,
        },
      ];
}
