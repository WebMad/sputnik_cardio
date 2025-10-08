import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_recording/workout_deps_node.dart';
import 'package:sputnik_localization/sputnik_localization.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';

import '../widgets/pending_workouts_card.dart';
import '../widgets/workout_card.dart';
import 'workouts_screen_presenter.dart';
import 'workouts_screen_state.dart';
import '../widgets/workouts_screen_error_banner.dart';

class WorkoutsScreen extends StatefulWidget {
  const WorkoutsScreen({super.key});

  @override
  State<WorkoutsScreen> createState() => _WorkoutsScreenState();
}

class _WorkoutsScreenState extends State<WorkoutsScreen> {
  late final WorkoutsScreenPresenter _presenter;
  late final ScrollController _scrollController;

  void _startNewWorkout() {
    final tabController = DefaultTabController.of(context);
    tabController.animateTo(0);
  }

  @override
  void initState() {
    super.initState();

    final depsNode = DepsNodeBinder.of<WorkoutDepsNode>(context);
    _presenter = WorkoutsScreenPresenter(depsNode: depsNode);

    _scrollController = ScrollController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    if (mounted && _scrollController.position.extentAfter < 500) {
      _presenter.handleScrollEnd();
    }
  }

  @override
  void dispose() {
    _presenter.dispose();
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SpukiScaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => _presenter.refreshWorkouts(),
          child: StreamBuilder<WorkoutsScreenState>(
            initialData: _presenter.state,
            stream: _presenter.stream,
            builder: (context, snapshot) {
              final state = snapshot.data!;
              return _buildContent(state);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildContent(WorkoutsScreenState state) {
    // Баннер ошибки поверх существующих данных
    if (state.isLoaded && state.showErrorBanner) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: WorkoutsScreenErrorBanner(
              errorMessage: state.errorMessage ?? 'Неизвестная ошибка',
              onRetry: _presenter.retryOnError,
            ),
          ),
          Expanded(child: _buildWorkoutsList(state)),
        ],
      );
    }

    // Полноэкранные состояния
    if (state.isLoading && !state.hasData) {
      return _buildLoadingState();
    }

    if (state.isError) {
      return _buildErrorState(state.errorMessage);
    }

    if (state.isLoaded && !state.hasData) {
      return _buildEmptyState();
    }

    // Основной список тренировок
    return _buildWorkoutsList(state);
  }

  Widget _buildLoadingState() {
    return Center(
      child: SpukiText(context.tr.workoutListLoading),
    );
  }

  Widget _buildErrorState(String? errorMessage) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorMessage ?? context.tr.workoutListError,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _presenter.retryOnError,
            child: Text(context.tr.retry),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.tr.noWorkouts,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _startNewWorkout,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple[80],
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
            ),
            child: Text(context.tr.recordTrain),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutsList(WorkoutsScreenState state) {
    return Column(
      children: [
        const PendingWorkoutsCard(),
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: state.workouts.length,
            itemBuilder: (context, index) => WorkoutCard(
              detailedWorkout: state.workouts[index],
            ),
          ),
        ),
      ],
    );
  }
}