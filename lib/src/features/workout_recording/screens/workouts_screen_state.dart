//Модель состояния экрана с множеством статусов и классом состояния

import 'package:flutter/foundation.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/detailed_workout.dart';

@immutable
class WorkoutsScreenState {
  final List<DetailedWorkout> workouts;
  final WorkoutsScreenStatus status;
  final String? errorMessage;
  final bool showErrorBanner;

  const WorkoutsScreenState({
    required this.workouts,
    required this.status,
    this.errorMessage,
    this.showErrorBanner = false,
  });

  WorkoutsScreenState copyWith({
    List<DetailedWorkout>? workouts,
    WorkoutsScreenStatus? status,
    String? errorMessage,
    bool? showErrorBanner,
  }) {
    return WorkoutsScreenState(
      workouts: workouts ?? this.workouts,
      status: status ?? this.status,
      errorMessage: errorMessage,
      showErrorBanner: showErrorBanner ?? this.showErrorBanner,
    );
  }

  bool get isLoading => status == WorkoutsScreenStatus.loading;
  bool get isError => status == WorkoutsScreenStatus.error;
  bool get isLoaded => status == WorkoutsScreenStatus.loaded;
  bool get hasData => workouts.isNotEmpty;
}

enum WorkoutsScreenStatus {
  loading,  // Загрузка данных
  error,    // Ошибка (только когда нет данных)
  loaded,   // Данные загружены
}