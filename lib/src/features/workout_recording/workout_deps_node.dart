import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/auth/auth_deps_node.dart';
import 'package:sputnik_cardio/src/features/auth/auth_scope_deps_node.dart';
import 'package:sputnik_cardio/src/features/tracking/tracking_deps_node.dart';
import 'package:sputnik_cardio/src/features/workout_recording/state_holders/workout_state_holder.dart';
import 'package:sputnik_cardio/src/features/workout_track/workout_track_deps_node.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

import '../workout_managing/di/workout_managing_deps_node.dart';
import 'data_sources/workout_remote_data_source.dart';
import 'managers/workout_coords_recording_manager.dart';
import 'managers/workout_lifecycle_manager.dart';
import 'managers/workout_list_manager.dart';
import 'providers/workout_track_provider.dart';
import 'state_holders/workouts_list_state_holder.dart';
import 'workout_info_screen_deps_node.dart';

class WorkoutDepsNode extends DepsNode {
  final AuthScopeDepsNode parent;
  final LocationDepsNode _locationDepsNode;
  final AuthDepsNode _authDepsNode;

  // late final workoutScreenDepsNode = bindSingletonFactory(
  //   (int workoutId) => WorkoutInfoScreenDepsNode(
  //     workoutId,
  //     workoutLifecycleDepsNode(),
  //   ),
  // );

  late final workoutStateHolder = bind(
    () => WorkoutStateHolder(),
  );

  late final workoutLifecycleManager = bind(
    () => WorkoutLifecycleManager(
      workoutStateHolder(),
      workoutManagingDepsNode().workoutManager(),
      _workoutCoordsRecordingManager(),
      const Uuid(),
      workoutTrackDepsNode(),
    ),
  );

  late final workoutRemoteDataSource = bind(
    () => WorkoutRemoteDataSource(
      Supabase.instance.client,
      _authDepsNode.authController(),
    ),
  );

  late final _workoutCoordsRecordingManager = bind(
    () => WorkoutCoordsRecordingManager(
      _locationDepsNode.locationManager(),
      workoutTrackDepsNode(),
      workoutStateHolder(),
    ),
  );

  late final workoutListManager = bind(
    () => WorkoutListManager(
      workoutRemoteDataSource(),
      workoutsListStateHolder(),
    ),
  );

  late final workoutsListStateHolder = bind(
    () => WorkoutsListStateHolder(),
  );

  late final workoutTrackProvider = bind(
    () => WorkoutTrackProvider(),
  );

  late final workoutManagingDepsNode = bind(
    () => WorkoutManagingDepsNode(),
  );

  late final workoutTrackDepsNode = bind(
    () => WorkoutTrackDepsNode(),
  );

  WorkoutDepsNode(
    this.parent,
    this._locationDepsNode,
    this._authDepsNode,
  );

  @override
  List<Set<LifecycleDependency>> get initializeQueue => [
        {
          workoutsListStateHolder,
          workoutStateHolder,
        },
        {
          workoutManagingDepsNode,
          _workoutCoordsRecordingManager,
        },
      ];
}
