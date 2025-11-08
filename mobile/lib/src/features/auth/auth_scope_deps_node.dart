import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/common/app_scope_deps_node.dart';
import 'package:sputnik_cardio/src/common/managers/shared_prefs_manager.dart';
import 'package:sputnik_cardio/src/features/app_foreground_service/di/app_foreground_service_deps_node.dart';
import '../gentle_perms/di/gentle_perms_deps_node.dart';
import '../maps/maps_deps_node.dart';
import '../tracking/tracking_deps_node.dart';
import '../workout_recording/workout_deps_node.dart';

class AuthScopeDepsNode extends DepsNode {
  final AppScopeDepsNode appDepsNode;

  AuthScopeDepsNode(this.appDepsNode);

  @override
  List<Set<LifecycleDependency>> get initializeQueue => [
        {appForegroundServiceDepsNode},
        {gentlePermsDepsNode},
        {locationDepsNode},
        {
          workoutDepsNode,
        },
        {
          mapsDepsNode,
        },
      ];

  late final mapsDepsNode = bind(
    () => MapsDepsNode(locationDepsNode()),
  );

  late final workoutDepsNode = bind(
    () => WorkoutDepsNode(
      this,
      locationDepsNode(),
      appDepsNode.sharedPrefsManager(),
      appForegroundServiceDepsNode(),
    ),
  );

  late final appForegroundServiceDepsNode = bind(
    () => AppForegroundServiceDepsNode(),
  );

  late final locationDepsNode = bind(
    () => LocationDepsNode(
      appForegroundServiceDepsNode(),
      gentlePermsDepsNode(),
    ),
  );

  late final gentlePermsDepsNode = bind(
    () => GentlePermsDepsNode(),
  );
}
