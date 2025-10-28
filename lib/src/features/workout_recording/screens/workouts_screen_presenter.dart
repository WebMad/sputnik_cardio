
import 'dart:async';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_recording/managers/workout_list_manager.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/workouts_list_data.dart';
import 'package:sputnik_cardio/src/features/workout_recording/state_holders/workouts_list_state_holder.dart';
import '../models/workouts_screen_state.dart';

class WorkoutsScreenPresenter extends StateHolder<WorkoutsScreenState> {
  final WorkoutsListStateHolder _workoutsListStateHolder;
  final WorkoutListManager _workoutListManager;

  WorkoutsScreenPresenter(
    this._workoutsListStateHolder,
    this._workoutListManager
  )  :super(
        const WorkoutsScreenState(
          workouts: const [],
          status: WorkoutsScreenStatus.loading,
        ),
      );

  StreamSubscription<WorkoutsListData?>? _workoutsSubscription;


  @override
  Future<void> init() async{
    super.init();

    _workoutsSubscription = _workoutsListStateHolder.asStream.listen(_handleWorkoutsDataUpdate);

  }

  void _handleWorkoutsDataUpdate(WorkoutsListData? data) {
    if (data == null) {
      return;
    }

    data.map(
      loading: (_) {
        if (state.workouts.isEmpty) {
          state = state.copyWith(
            status: WorkoutsScreenStatus.loading,
            errorMessage: null,
            showErrorBanner: false,
          );
        }
      },
      data: (dataState) {
        state = state.copyWith(
          workouts: dataState.workouts,
          status: WorkoutsScreenStatus.loaded,
          errorMessage: null,
          showErrorBanner: false,
        );
      },
    );
  }

  Future<void> loadWorkouts() async {
    _workoutListManager.load();
  }

  Future<void> refreshWorkouts() async {
    await _workoutListManager.refresh();
  }

  Future<void> retryOnError() async {
    state = state.copyWith(
      errorMessage: null,
      showErrorBanner: false,
    );

    if (state.workouts.isEmpty) {
      state = state.copyWith(
        status: WorkoutsScreenStatus.loading,
      );
    }

    await loadWorkouts();
  }

  void handleScrollEnd() {
    _workoutListManager.handleAtEdge();
  }

  @override
  Future<void> dispose() async {
    await _workoutsSubscription?.cancel();
    await super.dispose();
  }
}