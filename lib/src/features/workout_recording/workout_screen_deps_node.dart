import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_recording/managers/workout_coords_loader_manager.dart';
import 'package:sputnik_cardio/src/features/workout_recording/providers/workout_track_provider.dart';
import 'package:sputnik_cardio/src/features/workout_recording/workout_lifecycle_deps_node.dart';

class WorkoutScreenDepsNode extends DepsNode {
  final WorkoutLifecycleDepsNode _workoutLifecycleDepsNode;
  final int workoutId;

  late final workoutTrackProvider = bind(
    () => WorkoutTrackProvider(),
  );

  late final _workoutTrackProviderWithLifecycle = bind(
    () {
      final provider = workoutTrackProvider();

      return RawLifecycle(
        onInit: () async {},
        onDispose: () async => provider.dispose(),
      );
    },
  );

  late final workoutCoordsLoaderManager = bind(
    () => WorkoutCoordsLoaderManager(
      workoutId,
      _workoutLifecycleDepsNode.workoutRemoteDataSource(),
      workoutTrackProvider(),
    ),
  );

  WorkoutScreenDepsNode(
    this.workoutId,
    this._workoutLifecycleDepsNode,
  );

  @override
  List<Set<LifecycleDependency>> get initializeQueue => [
        {
          _workoutTrackProviderWithLifecycle,
        },
        {
          workoutCoordsLoaderManager,
        }
      ];
}
