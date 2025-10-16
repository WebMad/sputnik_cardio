import 'package:flutter/material.dart';
import '../screens/workouts_screen_presenter.dart';
import '../screens/workouts_screen_state.dart';
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
    print('🔄 WorkoutsContent: building with ${state.workouts.length} workouts');
    print('🎯 WorkoutsContent: status = ${state.status}');
    if (state.isLoaded && state.showErrorBanner) {
      print('📢 WorkoutsContent: showing error banner');
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: WorkoutsScreenErrorBanner(
              errorMessage: state.errorMessage ?? 'Неизвестная ошибка',
              onRetry: presenter.retryOnError,
            ),
          ),
          Expanded(child: WorkoutsList(state: state, scrollController: scrollController)),
        ],
      );
    }

    if (state.isLoading && !state.hasData) {
      print('📢 WorkoutsContent: showing loading state');
      return const WorkoutsLoadingState();
    }

    if (state.isError) {
      print('📢 WorkoutsContent: showing error state');
      return WorkoutsErrorState(
        errorMessage: state.errorMessage,
        onRetry: presenter.retryOnError,
      );
    }

    if (state.isLoaded && !state.hasData) {
      print('📢 WorkoutsContent: showing empty state');
      return WorkoutsEmptyState(onStartNewWorkout: onStartNewWorkout);
    }
    print('📢 WorkoutsContent: showing workouts list');
    return WorkoutsList(state: state, scrollController: scrollController);
  }
}