
import 'dart:async';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/workouts_list_data.dart';
import 'package:sputnik_cardio/src/features/workout_recording/workout_deps_node.dart';

import 'workouts_screen_state.dart';

class WorkoutsScreenPresenter extends StateHolder<WorkoutsScreenState> {
  WorkoutsScreenPresenter({
    required WorkoutDepsNode depsNode,
  }) : _depsNode = depsNode,
        super(
        const WorkoutsScreenState(
          workouts: const [],
          status: WorkoutsScreenStatus.loading,
        ),
      ) {
    _init();
  }

  final WorkoutDepsNode _depsNode;
  StreamSubscription<WorkoutsListData?>? _workoutsSubscription;

  void _init() {
    // Подписываемся на изменения списка тренировок
    _workoutsSubscription = _depsNode
        .workoutsListStateHolder()
        .stream
        .listen(_handleWorkoutsDataUpdate);

    // Загружаем начальные данные
    loadWorkouts();
  }

  void _handleWorkoutsDataUpdate(WorkoutsListData? data) {
    if (data == null) return;

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

  /// Загружает список тренировок
  Future<void> loadWorkouts() async {
    _depsNode.workoutListManager().load();
  }

  /// Обновляет список тренировок (pull-to-refresh)
  Future<void> refreshWorkouts() async {
    await _depsNode.workoutListManager().refresh();
  }

  /// Повторяет загрузку при ошибке
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

  /// Обрабатывает достижение конца списка для пагинации
  void handleScrollEnd() {
    _depsNode.workoutListManager().handleAtEdge();
  }

  @override
  Future<void> dispose() async {
    await _workoutsSubscription?.cancel();
    await super.dispose();
  }
}