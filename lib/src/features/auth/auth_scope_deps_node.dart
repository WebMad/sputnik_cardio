import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/common/app_scope_deps_node.dart';
import '../maps/maps_deps_node.dart';
import '../workout_recording/workout_deps_node.dart';

class AuthScopeDepsNode extends DepsNode {
  final AppScopeDepsNode _appDepsNode;

  AuthScopeDepsNode(this._appDepsNode);

  @override
  List<Set<LifecycleDependency>> get initializeQueue => [
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
      this,
      _appDepsNode.locationDepsNode(),
      _appDepsNode.authDepsNode(),
    ),
  );
}
