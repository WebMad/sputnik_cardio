import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/gentle_perms/models/gentle_perm.dart';
import 'package:sputnik_cardio/src/features/workout_core/workout_core.dart';
import 'package:sputnik_cardio/src/features/auth/auth_scope_deps_node.dart';
import 'package:sputnik_cardio/src/features/workout_recording/managers/workout_lifecycle_manager.dart';
import 'package:sputnik_cardio/src/features/workout_recording/models/workout_save_state.dart';
import 'package:sputnik_cardio/src/features/workout_recording/screens/pending_workouts_screen.dart';
import 'package:sputnik_cardio/src/features/workout_recording/state_holders/workout_save_state_holder.dart';
import 'package:sputnik_cardio/src/features/workout_recording/workout_deps_node.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';

import '../../gentle_perms/state_holders/actual_perms_state_holder.dart';
import '../../gentle_perms/widgets/gentle_perms_card.dart';
import '../../maps/widgets/sputnik_map.dart';
import '../widgets/active_workout_metrics.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authScope = context.depsNode<AuthScopeDepsNode>(listen: true);

    final gentlePermsDepsNode = authScope.gentlePermsDepsNode();

    final gentlePermsStateHolder = gentlePermsDepsNode.actualPermsStateHolder();

    final workoutDepsNode = context.depsNode<WorkoutDepsNode>(listen: true);

    final workoutLifecycleManager = workoutDepsNode.workoutLifecycleManager();

    final workoutStateHolder = workoutDepsNode.persistentWorkoutStateHolder;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: StateHolderBuilder<ActualPermsStateHolder, Set<GentlePerm>>(
              holder: gentlePermsStateHolder,
              builder: (context, state) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    const SputnikMap(),
                    if (state.isEmpty) ...[
                      StreamBuilder<Workout?>(
                        initialData: workoutStateHolder.state,
                        stream: workoutStateHolder.stream,
                        builder: (context, snapshot) {
                          final workout = snapshot.data;

                          if (workout == null) {
                            return const SizedBox.shrink();
                          }

                          return Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: ColoredBox(
                              color: SpukiTheme.of(context)
                                  .scaffoldBackgroundColor,
                              child: const SafeArea(
                                child: ActiveWorkoutMetrics(),
                              ),
                            ),
                          );
                        },
                      ),
                      Positioned(
                        bottom: 8,
                        left: 0,
                        right: 10,
                        child: StreamBuilder<Workout?>(
                          initialData: workoutStateHolder.state,
                          stream: workoutStateHolder.stream,
                          builder: (context, snapshot) {
                            final workout = snapshot.data;
                            if (workout?.state == WorkoutState.idle || workout?.state == null) {
                              return _ActivityCarousel(
                                workoutLifecycleManager: workoutLifecycleManager,
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        child: StreamBuilder<Workout?>(
                          initialData: workoutStateHolder.state,
                          stream: workoutStateHolder.stream,
                          builder: (context, snapshot) {
                            final workout = snapshot.data;
                            switch (workout?.state) {
                              case null:
                              case WorkoutState.idle:
                                return const SizedBox.shrink();
                              case WorkoutState.inProcess:
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        workoutLifecycleManager.pause();
                                      },
                                      child: const Text('Pause'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        workoutLifecycleManager.stop();
                                      },
                                      child: const Text('Stop'),
                                    ),
                                  ],
                                );
                              case WorkoutState.paused:
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        workoutLifecycleManager.resume();
                                      },
                                      child: const Text('Resume'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        workoutLifecycleManager.stop();
                                      },
                                      child: const Text('Stop'),
                                    ),
                                  ],
                                );
                              case WorkoutState.stopped:
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    StateHolderBuilder<WorkoutSaveStateHolder,
                                        WorkoutSaveState>(
                                      holder: workoutDepsNode
                                          .workoutSaveStateHolder(),
                                      builder: (context, state) =>
                                          state.maybeMap(
                                        saving: (_) => const Text(
                                          'Идет сохранение тренировки...',
                                        ),
                                        saved: (_) => const Text(
                                          'Тренировка сохранена',
                                        ),
                                        error: (_) => GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pushNamed(
                                              PendingWorkoutsScreen.routeName,
                                            );
                                          },
                                          child: const Text(
                                            'Ошибка при сохранении тренировки.\nНажмите чтобы перейти к списку\nнесохраненный тренировок.',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        orElse: () => const SizedBox.shrink(),
                                      ),
                                    ),
                                    const Text('Stopped training'),
                                    const SizedBox(height: 10),
                                    ElevatedButton(
                                      onPressed: () {
                                        workoutLifecycleManager.reset();
                                      },
                                      child: const Text('Reset'),
                                    ),
                                  ],
                                );
                            }
                          },
                        ),
                      ),
                    ] else
                      const Positioned.fill(
                        child: GentlePermsCard(),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ActivityCarousel extends StatefulWidget {
  final WorkoutLifecycleManager workoutLifecycleManager;

  const _ActivityCarousel({required this.workoutLifecycleManager});

  @override
  State<_ActivityCarousel> createState() => _ActivityCarouselState();
}

class _ActivityCarouselState extends State<_ActivityCarousel> {
  late PageController _pageController;

  final List<_ActivityData> activities = [
    _ActivityData(name: 'Велосипед', icon: Icons.directions_bike),
    _ActivityData(name: 'Бег', icon: Icons.directions_run),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 100,
          child: PageView.builder(
            controller: _pageController,
            itemCount: activities.length,
            itemBuilder: (context, index) {
              final activity = activities[index];
              return FractionallySizedBox(
                widthFactor: 0.7,
                heightFactor: 0.6,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEF7FF),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.grey,
                    )
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Icon(activity.icon, size: 28, color: Colors.black87),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          activity.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          widget.workoutLifecycleManager.start();
                        },
                        child: const Text('Start'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ActivityData {
  final String name;
  final IconData icon;

  _ActivityData({required this.name, required this.icon});
}
