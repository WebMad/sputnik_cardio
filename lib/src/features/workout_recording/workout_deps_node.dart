import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/common/managers/shared_prefs_manager.dart';
import 'package:sputnik_cardio/src/features/app_foreground_service/di/app_foreground_service_deps_node.dart';
import 'package:sputnik_cardio/src/features/auth/auth_scope_deps_node.dart';
import 'package:sputnik_cardio/src/features/internet_connection_checker/state_holder/internet_connection_state_holder.dart';
import 'package:sputnik_cardio/src/features/tracking/tracking_deps_node.dart';
import 'package:sputnik_cardio/src/features/workout_core/workout_core.dart';
import 'package:sputnik_cardio/src/features/workout_metrics/workout_metrics_deps_node.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/data_sources/workout_local_data_source.dart';
import 'package:sputnik_cardio/src/features/workout_recording/data/repository/workout_repository.dart';
import 'package:sputnik_cardio/src/features/workout_recording/managers/pending_workouts_manager.dart';
import 'package:sputnik_cardio/src/features/workout_recording/managers/workout_retrive_manager.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/detailed_workout.dart';
import 'package:sputnik_cardio/src/features/workout_recording/state_holders/pending_workouts_save_state_holder.dart';
import 'package:sputnik_cardio/src/features/workout_recording/state_holders/workout_state_holder.dart';
import 'package:sputnik_cardio/src/features/workout_recording/workout_info_screen_deps_node.dart';
import 'package:sputnik_cardio/src/features/workout_track/workout_track_deps_node.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'data/data_sources/workout_remote_data_source.dart';
import 'managers/workout_coords_recording_manager.dart';
import 'managers/workout_lifecycle_manager.dart';
import 'managers/workout_list_manager.dart';
import 'state_holders/pending_workouts_state_holder.dart';
import 'state_holders/workout_save_state_holder.dart';
import 'state_holders/workouts_list_state_holder.dart';
import 'screens/workouts_screen_presenter.dart';

class WorkoutDepsNode extends DepsNode implements WorkoutMetricsParent {
  final AuthScopeDepsNode parent;
  final LocationDepsNode _locationDepsNode;
  final SharedPrefsManager _sharedPrefsManager;
  final AppForegroundServiceDepsNode _appForegroundServiceDepsNode;

  late final workoutCoreDepsNode = bind(
    () => SputnikWorkoutCoreController(),
  );

  late final _persistentWorkoutStateHolder = bind(
    () => PersistentWorkoutStateHolder(),
  );

  late final workoutsScreenPresenter = bind(
        () => WorkoutsScreenPresenter(
      workoutsListStateHolder(),
      workoutListManager(),
    ),
  );

  late final workoutLifecycleManager = bind(
    () => WorkoutLifecycleManager(
      workoutsListStateHolder(),
      workoutListManager(),
      persistentWorkoutStateHolder,
      _workoutCoordsRecordingManager(),
      workoutTrackDepsNode,
      workoutRepository(),
      pendingWorkoutsManager(),
      workoutCoreDepsNode().workoutModificationManagerFactory,
      _appForegroundServiceDepsNode.appForegroundServiceManager(),
      workoutSaveStateHolder(),
    ),
  );

  late final pendingWorkoutsManager = bind(
    () => PendingWorkoutsManager(
      pendingWorkoutsStateHolder(),
      workoutDataSource(),
      internetConnectionStateHolder,
      workoutRepository(),
      pendingWorkoutSaveStateHolder(),
    ),
  );

  late final pendingWorkoutSaveStateHolder = bind(
    () => PendingWorkoutsSaveStateHolder(),
  );

  late final pendingWorkoutsStateHolder = bind(
    () => PendingWorkoutsStateHolder(),
  );

  late final workoutRetriveManager = bind(
    () => WorkoutRetriveManager(
      workoutLifecycleManager(),
      workoutRepository(),
    ),
  );

  late final workoutRemoteDataSource = bind(
    () => WorkoutRemoteDataSource(
      Supabase.instance.client,
      parent.appDepsNode
          .authScopeDepsNode()
          .appDepsNode
          .authDepsNode()
          .authController(),
    ),
  );

  late final workoutRepository = bind(
    () => WorkoutRepository(
      workoutRemoteDataSource(),
      workoutTrackDepsNode,
      workoutDataSource(),
      internetConnectionStateHolder,
      workoutMetricsDepsNode().workoutMetricsStateHolder(),
      workoutMetricsDepsNode().workoutMetricsDataSource(),
    ),
  );

  late final _workoutCoordsRecordingManager = bind(
    () => WorkoutCoordsRecordingManager(
      _locationDepsNode.locationManager(),
      workoutTrackDepsNode,
      persistentWorkoutStateHolder,
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

  late final _workoutTrackDepsNode = bind(
    () => WorkoutTrackDepsNode(_sharedPrefsManager),
  );

  late final workoutDataSource = bind<WorkoutLocalDataSource>(
    () => WorkoutLocalDataSourceImpl(_sharedPrefsManager.sharedPreferences),
  );

  late final connectivity = bind(
    () => Connectivity(),
  );

  late final workoutInfoScreenDepsNode = bindSingletonFactory(
    (DetailedWorkout detailedWorkout) =>
        WorkoutInfoScreenDepsNode(detailedWorkout),
  );

  late final workoutSaveStateHolder = bind(
    () => WorkoutSaveStateHolder(),
  );

  WorkoutDepsNode(
    this.parent,
    this._locationDepsNode,
    this._sharedPrefsManager,
    this._appForegroundServiceDepsNode,
  );

  @override
  WorkoutTrackDepsNode get workoutTrackDepsNode => _workoutTrackDepsNode();

  @override
  PersistentWorkoutStateHolder get persistentWorkoutStateHolder =>
      _persistentWorkoutStateHolder();

  InternetConnectionStateHolder get internetConnectionStateHolder =>
      parent.appDepsNode
          .internetConnectionDepsNode()
          .internetConnectionCheckerStateHolder();

  late final workoutMetricsDepsNode = bind(
    () => WorkoutMetricsDepsNode(
      this,
      Supabase.instance.client,
    ),
  );

  @override
  List<Set<LifecycleDependency>> get initializeQueue => [
        {
          workoutCoreDepsNode,
        },
        {
          workoutsListStateHolder,
          _persistentWorkoutStateHolder,
        },
        {
          workoutMetricsDepsNode,
          _workoutCoordsRecordingManager,
          pendingWorkoutsManager,
          workoutLifecycleManager,
        },
        {
          workoutsScreenPresenter,
        },
        {
          workoutRetriveManager,
        },
      ];
}
