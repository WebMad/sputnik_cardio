import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:intl/intl.dart';
import 'package:sputnik_cardio/src/features/auth/auth_scope_deps_node.dart';
import 'package:sputnik_cardio/src/features/workout_recording/workout_deps_node.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';

import '../../maps/widgets/sputnik_map.dart';
import '../../workout_managing/models/workout.dart';
import '../state_holders/workout_state_holder.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authScope = context.depsNode<AuthScopeDepsNode>(listen: true);

    final workoutDepsNode = context.depsNode<WorkoutDepsNode>(listen: true);

    final workoutLifecycleManager = workoutDepsNode.workoutLifecycleManager();

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                const SputnikMap(),
                // StreamBuilder(
                //     initialData: workoutDepsNode.workoutStateHolder().state,
                //     stream: workoutDepsNode.workoutStateHolder().stream,
                //     builder: (context, snapshot) {
                //       final workout = snapshot.data;
                //
                //       if (workout == null || workout.segments.isEmpty) {
                //         return const SizedBox.shrink();
                //       }
                //
                //       // final startAt = workout.segments.first.startAt;
                //       // final endAt = workout.segments.last.endAt;
                //
                //       return Positioned(
                //         child: Container(
                //           child:
                //               SpukiText(startAt.difference(endAt).toString()),
                //         ),
                //       );
                //     }),
                Positioned(
                  bottom: 10,
                  child: StreamBuilder<Workout?>(
                    initialData: workoutDepsNode.workoutStateHolder().state,
                    stream: workoutDepsNode.workoutStateHolder().stream,
                    builder: (context, snapshot) {
                      final workout = snapshot.data;
                      switch (workout?.state) {
                        case null:
                        case WorkoutState.idle:
                          return ElevatedButton(
                            onPressed: () {
                              workoutLifecycleManager.start();
                            },
                            child: const Text('Start'),
                          );
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
