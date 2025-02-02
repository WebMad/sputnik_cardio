import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/common/app_scope_deps_node.dart';

import '../maps/maps_deps_node.dart';
import '../tracking/tracking_deps_node.dart';
import '../workout_recording/workout_lifecycle_deps_node.dart';

class AuthScopeDepsNode extends DepsNode {
  final AppScopeDepsNode _appDepsNode;

  AuthScopeDepsNode(this._appDepsNode);

  @override
  List<Set<Lifecycle Function()>> get initializeQueue => [
        {
          trackingDataDepsNode,
        },
        {
          workoutLifecycleDepsNode,
        },
        {
          trackingDepsNode,
          mapsDepsNode,
        },
      ];

  late final mapsDepsNode = bind(
    () => MapsDepsNode(_appDepsNode.locationDepsNode()),
  );

  late final trackingDataDepsNode = bind(() => TrackingDataDepsNode());

  late final workoutLifecycleDepsNode = bind(
    () => WorkoutLifecycleDepsNode(
      trackingDataDepsNode(),
      _appDepsNode.locationDepsNode(),
      _appDepsNode.authDepsNode(),
    ),
  );

  late final trackingDepsNode = bind(
    () => TrackingDepsNode(
      trackingDataDepsNode(),
      _appDepsNode.locationDepsNode(),
      workoutLifecycleDepsNode(),
    ),
  );
}
