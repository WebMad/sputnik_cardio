import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/auth/auth_di.dart';
import 'package:sputnik_cardio/src/features/tracking/tracking_deps_node.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data_sources/workout_remote_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_recording/managers/workout_coords_recording_manager.dart';
import 'package:sputnik_cardio/src/features/workout_recording/managers/workout_lifecycle_manager.dart';
import 'package:sputnik_cardio/src/features/workout_recording/managers/workout_list_manager.dart';
import 'package:sputnik_cardio/src/features/workout_recording/providers/workout_track_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'state_holders/workouts_list_state_holder.dart';

class WorkoutLifecycleDepsNode extends DepsNode {
  final TrackingDataDepsNode _trackingDataDepsNode;
  final LocationDepsNode _locationDepsNode;
  final AuthDi _authDi;

  late final workoutLifecycleManager = bind(
    () => WorkoutLifecycleManager(
      _workoutRemoteDataSource,
      _locationDepsNode.locationManager,
      _trackingDataDepsNode.trackingHolder,
      _workoutCoordsRecordingManager,
    ),
  );

  late final _workoutRemoteDataSource = bind(
    () => WorkoutRemoteDataSource(
      Supabase.instance.client,
      _authDi.authController,
    ),
  );

  late final _workoutCoordsRecordingManager = bind(
    () => WorkoutCoordsRecordingManager(
      _locationDepsNode.locationManager,
      _trackingDataDepsNode.trackingHolder,
      _workoutRemoteDataSource,
      workoutTrackProvider,
    ),
  );

  late final workoutListManager = bind(
    () => WorkoutListManager(
      _workoutRemoteDataSource,
      workoutsListStateHolder,
    ),
  );

  late final workoutsListStateHolder = bind(
    () => WorkoutsListStateHolder(),
  );

  late final workoutTrackProvider = bind(
    () => WorkoutTrackProvider(),
  );

  WorkoutLifecycleDepsNode(
    this._trackingDataDepsNode,
    this._locationDepsNode,
    this._authDi,
  );
}
