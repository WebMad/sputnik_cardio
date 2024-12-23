import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_recording/managers/workout_coords_loader_manager.dart';
import 'package:sputnik_cardio/src/features/workout_recording/providers/workout_track_provider.dart';
import 'package:sputnik_cardio/src/features/workout_recording/workout_lifecycle_deps_node.dart';

class WorkoutCoordsDepsNode extends DepsNode {
  final WorkoutLifecycleDepsNode _workoutLifecycleDepsNode;

  late final workoutTrackProvider = bind(
    () => WorkoutTrackProvider(),
  );

  late final workoutCoordsLoaderManager = bind(
    () => WorkoutCoordsLoaderManager(
      _workoutLifecycleDepsNode.workoutRemoteDataSource,
      workoutTrackProvider,
    ),
  );

  WorkoutCoordsDepsNode(this._workoutLifecycleDepsNode);
}
