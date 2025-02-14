import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/common/app_scope_deps_node.dart';
import 'package:sputnik_cardio/src/features/auth/auth_scope_deps_node.dart';
import 'package:sputnik_cardio/src/features/tracking/presentation/presenters/tracking_presenter/tracking_model.dart';
import 'package:sputnik_cardio/src/features/tracking/tracking_deps_node.dart';
import 'package:sputnik_cardio/src/features/workout_recording/realtime_metrics_deps_node.dart';
import 'package:sputnik_cardio/src/features/workout_recording/workout_lifecycle_deps_node.dart';

import '../../../maps/widgets/sputnik_map.dart';
import '../../../workout_recording/widgets/realtime_metrics_view.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authScope = context.depsNode<AuthScopeDepsNode>(listen: true);

    final workoutDepsNode = authScope.workoutDepsNode();

    final trackingDepsNode = workoutDepsNode.trackingDepsNode();
    final trackingDataDepsNode = workoutDepsNode.trackingDataDepsNode();

    final workoutLifecycleContainer =
        workoutDepsNode.workoutLifecycleDepsNode();

    final trackingHolder = trackingDataDepsNode.trackingHolder();
    final trackingPresenter = trackingDepsNode.trackingPresenter();

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                const SputnikMap(),
                StreamBuilder<TrackingModel>(
                  initialData: trackingHolder.state,
                  stream: trackingHolder.stream,
                  builder: (context, snapshot) {
                    return Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: DepsNodeBuilder<WorkoutLifecycleDepsNode>(
                        depsNode: workoutLifecycleContainer,
                        initialized: (context, depsNode) {
                          final realtimeMetricsDepsNode = depsNode
                              .workoutLifecycleManager()
                              .realtimeMetricsDepsNode;

                          if (realtimeMetricsDepsNode == null) {
                            return const SizedBox.shrink();
                          }

                          return DepsNodeBuilder(
                            depsNode: realtimeMetricsDepsNode,
                            bindOnInitialized: true,
                            initialized: (context, depsNode) {
                              return const RealtimeMetricsView();
                            },
                            orElse: (context, depsNode) {
                              return const SizedBox.shrink();
                            },
                          );
                        },
                        orElse: (context, depsNode) => const SizedBox.shrink(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          StreamBuilder(
            initialData: trackingHolder.state,
            stream: trackingHolder.stream,
            builder: (context, snapshot) {
              final data = snapshot.requireData;
              return data.map(
                initial: (value) {
                  return ElevatedButton(
                    onPressed: () {
                      trackingPresenter.start();
                    },
                    child: const Text('Start'),
                  );
                },
                played: (value) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          trackingPresenter.pause();
                        },
                        child: const Text('Pause'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          trackingPresenter.stop();
                        },
                        child: const Text('Stop'),
                      ),
                    ],
                  );
                },
                paused: (value) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          trackingPresenter.resume();
                        },
                        child: const Text('Resume'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          trackingPresenter.stop();
                        },
                        child: const Text('Stop'),
                      ),
                    ],
                  );
                },
                stopped: (value) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Stopped training'),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          trackingPresenter.reset();
                        },
                        child: const Text('Reset'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
