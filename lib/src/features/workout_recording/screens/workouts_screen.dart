import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/workout_recording/workout_deps_node.dart';
import 'package:sputnik_localization/sputnik_localization.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';
import 'workouts_screen_presenter.dart';
import 'workouts_screen_state.dart';
import '../widgets/workouts_content.dart';

class WorkoutsScreen extends StatefulWidget {
  const WorkoutsScreen({super.key});

  @override
  State<WorkoutsScreen> createState() => _WorkoutsScreenState();
}

class _WorkoutsScreenState extends State<WorkoutsScreen> {
  WorkoutsScreenPresenter? _presenter;
  late final ScrollController _scrollController;

  void _startNewWorkout() {
    final tabController = DefaultTabController.of(context);
    tabController.animateTo(0);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_presenter == null) {
      final depsNode = DepsNodeBinder.of<WorkoutDepsNode>(
          context); //связывает узел зависимостей типа узел зависимостей тренировок с контекстом
      _presenter = depsNode.workoutsScreenPresenter();
    }
    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    if (mounted && _scrollController.position.extentAfter < 500) {
      _presenter?.handleScrollEnd();
    }
  }

  @override
  void dispose() {
    _presenter?.dispose();
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_presenter == null) {
      return const CircularProgressIndicator();
    }
    return SpukiScaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => _presenter!.refreshWorkouts(),
          child: StreamBuilder<WorkoutsScreenState>(
            initialData: _presenter!.state,
            stream: _presenter!.stream,
            builder: (context, snapshot) {
              print('🔄 StreamBuilder: rebuilding, hasData: ${snapshot.hasData}');
              final state = snapshot.data!;
              return WorkoutsContent(
                presenter: _presenter!,
                state: state,
                onStartNewWorkout: _startNewWorkout,
                scrollController: _scrollController,
              );
            },
          ),
        ),
      ),
    );
  }
}