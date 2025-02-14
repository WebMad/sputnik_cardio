import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/common/app_scope_deps_node.dart';
import 'package:sputnik_cardio/src/features/workout_managing/di/workout_managing_deps_node.dart';

import '../active_workout/di/active_workout_deps_node.dart';
import '../maps/maps_deps_node.dart';
import '../tracking/tracking_deps_node.dart';
import '../workout_managing/models/workout.dart';
import '../workout_recording/workout_deps_node.dart';

class AuthScopeDepsNode extends DepsNode {
  final AppScopeDepsNode _appDepsNode;

  AuthScopeDepsNode(this._appDepsNode);

  @override
  List<Set<LifecycleDependency>> get initializeQueue => [
        {
          workoutManagingDepsNode,
        },
        {
          workoutDepsNode,
        },
        {
          mapsDepsNode,
        },
      ];

  late final mapsDepsNode = bind(
    () => MapsDepsNode(_appDepsNode.locationDepsNode()),
  );

  late final workoutDepsNode = bind(
    () => WorkoutDepsNode(
      _appDepsNode.locationDepsNode(),
      _appDepsNode.authDepsNode(),
    ),
  );

  late final activeWorkoutDepsNode = bindSingletonFactory(
    (Workout workout) => ActiveWorkoutDepsNode(
      workout,
      workoutManagingDepsNode(),
    ),
  );

  late final workoutManagingDepsNode = bind(
    () => WorkoutManagingDepsNode(),
  );
}
