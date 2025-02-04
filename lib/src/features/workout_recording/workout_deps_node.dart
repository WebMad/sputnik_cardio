import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/auth/auth_deps_node.dart';
import 'package:sputnik_cardio/src/features/tracking/tracking_deps_node.dart';
import 'package:sputnik_cardio/src/features/workout_recording/workout_lifecycle_deps_node.dart';

import 'workout_screen_deps_node.dart';

class WorkoutDepsNode extends DepsNode {
  final LocationDepsNode _locationDepsNode;
  final AuthDepsNode _authDepsNode;
  final TrackingDataDepsNode _trackingDataDepsNode;

  late final workoutLifecycleDepsNode = bind(
    () => WorkoutLifecycleDepsNode(
      _trackingDataDepsNode,
      _locationDepsNode,
      _authDepsNode,
    ),
  );

  late final workoutScreenDepsNode = bind(
    () => (int workoutId) => WorkoutScreenDepsNode(
          workoutId,
          workoutLifecycleDepsNode(),
        ),
  );

  WorkoutDepsNode(
    this._locationDepsNode,
    this._authDepsNode,
    this._trackingDataDepsNode,
  );

  @override
  List<Set<LifecycleDependency>> get initializeQueue => [
        {
          workoutLifecycleDepsNode,
        },
      ];
}
