import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/common/managers/shared_prefs_manager.dart';
import 'package:sputnik_cardio/src/features/auth/auth_deps_node.dart';
import 'package:sputnik_cardio/src/features/auth/auth_scope_deps_node.dart';
import 'package:sputnik_cardio/src/features/internet_connection_checker/state_holder/internet_connection_state_holder.dart';
import 'package:sputnik_cardio/src/features/tracking/tracking_deps_node.dart';
import 'package:sputnik_cardio/src/features/workout_core/workout_core_deps_node.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_sources/workout_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_sources/workout_track_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/repository/workout_repository.dart';
import 'package:sputnik_cardio/src/features/workout_recording/managers/pending_workouts_manager.dart';
import 'package:sputnik_cardio/src/features/workout_recording/managers/workout_retrive_manager.dart';
import 'package:sputnik_cardio/src/features/workout_recording/metrics_calculators/avg_speed_calculator.dart';
import 'package:sputnik_cardio/src/features/workout_recording/metrics_calculators/speed_calculator.dart';
import 'package:sputnik_cardio/src/features/workout_recording/metrics_calculators/time_calculator.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/detailed_workout.dart';
import 'package:sputnik_cardio/src/features/workout_recording/state_holders/workout_metrics_state_holder.dart';
import 'package:sputnik_cardio/src/features/workout_recording/state_holders/workout_state_holder.dart';
import 'package:sputnik_cardio/src/features/workout_recording/workout_info_screen_deps_node.dart';
import 'package:sputnik_cardio/src/features/workout_track/workout_track_deps_node.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

import '../workout_managing/di/workout_managing_deps_node.dart';
import 'data/data_sources/workout_remote_data_source.dart';
import 'managers/workout_coords_recording_manager.dart';
import 'managers/workout_lifecycle_manager.dart';
import 'managers/workout_list_manager.dart';
import 'managers/workout_metrics_manager.dart';
import 'metrics_calculators/km_metric_calculator.dart';
import 'state_holders/pending_workouts_state_holder.dart';
import 'state_holders/workouts_list_state_holder.dart';

class WorkoutDepsNode extends DepsNode {
  final AuthScopeDepsNode parent;
  final LocationDepsNode _locationDepsNode;
  final AuthDepsNode _authDepsNode;
  final SharedPrefsManager _sharedPrefsManager;

  late final workoutCoreDepsNode = bind(
    () => WorkoutCoreDepsNode(
      workoutStateHolder(),
    ),
  );

  late final workoutStateHolder = bind(
    () => WorkoutStateHolder(),
  );

  late final workoutLifecycleManager = bind(
    () => WorkoutLifecycleManager(
      workoutStateHolder(),
      workoutCoreDepsNode().workoutModificationManager(),
      _workoutCoordsRecordingManager(),
      workoutTrackDepsNode(),
      workoutDataSource(),
      workoutTrackDataSource(),
      workoutRepository(),
      pendingWorkoutsManager(),
    ),
  );

  late final pendingWorkoutsManager = bind(
    () => PendingWorkoutsManager(
      pendingWorkoutsStateHolder(),
      workoutDataSource(),
      internetConnectionStateHolder,
      workoutRemoteDataSource(),
    ),
  );

  late final pendingWorkoutsStateHolder = bind(
    () => PendingWorkoutsStateHolder(),
  );

  late final workoutRetriveManager = bind(
    () => WorkoutRetriveManager(
      workoutDataSource(),
      workoutLifecycleManager(),
    ),
  );

  late final workoutRemoteDataSource = bind(
    () => WorkoutRemoteDataSource(
      Supabase.instance.client,
      _authDepsNode.authController(),
    ),
  );

  late final workoutRepository = bind(
    () => WorkoutRepository(
      workoutRemoteDataSource(),
      workoutTrackDataSource(),
      workoutDataSource(),
      internetConnectionStateHolder,
    ),
  );

  late final _workoutCoordsRecordingManager = bind(
    () => WorkoutCoordsRecordingManager(
      _locationDepsNode.locationManager(),
      workoutTrackDepsNode(),
      workoutStateHolder(),
      workoutTrackDataSource(),
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

  late final workoutManagingDepsNode = bind(
    () => WorkoutManagingDepsNode(),
  );

  late final workoutTrackDepsNode = bind(
    () => WorkoutTrackDepsNode(),
  );

  late final workoutTrackDataSource = bind(
    () => WorkoutTrackDataSource(
      _sharedPrefsManager.sharedPreferences,
    ),
  );

  late final workoutDataSource = bind(
    () => WorkoutDataSource(_sharedPrefsManager.sharedPreferences),
  );

  late final workoutMetricsManager = bind(
    () => WorkoutMetricsManager(
      workoutStateHolder(),
      (String routeUuid) => workoutTrackDepsNode().trackProvider(routeUuid),
      kmMetricCalculator(),
      workoutMetricsStateHolder(),
      avgSpeedCalculator(),
      speedCalculator(),
      timeCalculator(),
    ),
  );

  late final connectivity = bind(
    () => Connectivity(),
  );

  late final workoutMetricsStateHolder = bind(
    () => WorkoutMetricsStateHolder(),
  );

  late final kmMetricCalculator = bind(
    () => KmMetricCalculator(
      (String routeUuid) => workoutTrackDepsNode().trackProvider(routeUuid),
    ),
  );

  late final avgSpeedCalculator = bind(
    () => const AvgSpeedCalculator(),
  );

  late final timeCalculator = bind(
    () => TimeCalculator(),
  );

  late final workoutInfoScreenDepsNode = bindSingletonFactory(
    (DetailedWorkout detailedWorkout) =>
        WorkoutInfoScreenDepsNode(detailedWorkout),
  );

  late final speedCalculator = bind(
    () => SpeedCalculator(
      (String routeUuid) => workoutTrackDepsNode().trackProvider(routeUuid),
    ),
  );

  WorkoutDepsNode(
    this.parent,
    this._locationDepsNode,
    this._authDepsNode,
    this._sharedPrefsManager,
  );

  InternetConnectionStateHolder get internetConnectionStateHolder =>
      parent.appDepsNode
          .internetConnectionDepsNode()
          .internetConnectionCheckerStateHolder();

  @override
  List<Set<LifecycleDependency>> get initializeQueue => [
        {
          workoutCoreDepsNode,
        },
        {
          workoutMetricsStateHolder,
          workoutsListStateHolder,
          workoutStateHolder,
        },
        {
          workoutMetricsManager,
          workoutManagingDepsNode,
          _workoutCoordsRecordingManager,
          pendingWorkoutsManager,
        },
        {
          workoutRetriveManager,
        },
      ];
}
