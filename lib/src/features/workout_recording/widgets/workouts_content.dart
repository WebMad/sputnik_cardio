import 'package:flutter/material.dart';
import '../screens/workouts_screen_presenter.dart';
import '../models/workouts_screen_state.dart';
import 'workouts_screen_error_banner.dart';
import 'workouts_loading_state.dart';
import 'workouts_error_state.dart';
import 'workouts_empty_state.dart';
import 'workouts_list.dart';

class WorkoutsContent extends StatelessWidget {
  final WorkoutsScreenPresenter presenter;
  final WorkoutsScreenState state;
  final VoidCallback onStartNewWorkout;
  final ScrollController scrollController;

  const WorkoutsContent({
    super.key,
    required this.presenter,
    required this.state,
    required this.onStartNewWorkout,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    if (state.isError) {

      return WorkoutsErrorState(
        errorMessage: state.errorMessage,
        onRetry: presenter.retryOnError,
      );
    }

    if (state.isLoading && !state.hasData) {
      return const WorkoutsLoadingState();
    }

    if (state.isLoaded && !state.hasData) {
      return WorkoutsEmptyState(onStartNewWorkout: onStartNewWorkout);
    }

    if (state.showErrorBanner) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: WorkoutsScreenErrorBanner(
              errorMessage: state.errorMessage ?? 'Неизвестная ошибка',
              onRetry: presenter.retryOnError,
            ),
          ),
          Expanded(child: WorkoutsList(
              state: state, scrollController: scrollController)),
        ],
      );
    }

    return WorkoutsList(state: state, scrollController: scrollController);
  }
}