import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/common/app_scope_deps_node.dart';
import 'package:sputnik_cardio/src/common/managers/shared_prefs_manager.dart';
import '../maps/maps_deps_node.dart';
import '../workout_recording/workout_deps_node.dart';

class AuthScopeDepsNode extends DepsNode {
  final AppScopeDepsNode appDepsNode;

  AuthScopeDepsNode(this.appDepsNode);

  @override
  List<Set<LifecycleDependency>> get initializeQueue => [
        {
          sharedPrefsManager,
        },
        {
          workoutDepsNode,
        },
        {
          mapsDepsNode,
        },
      ];

  late final mapsDepsNode = bind(
    () => MapsDepsNode(appDepsNode.locationDepsNode()),
  );

  late final workoutDepsNode = bind(
    () => WorkoutDepsNode(
      this,
      appDepsNode.locationDepsNode(),
      appDepsNode.authDepsNode(),
      sharedPrefsManager(),
    ),
  );

  late final sharedPrefsManager = bind(
    () => SharedPrefsManager(),
  );
}
