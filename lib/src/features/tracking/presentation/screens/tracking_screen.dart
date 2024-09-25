import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/tracking/tracking_deps_node.dart';

import '../../../maps/widgets/sputnik_map.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final trackingDepsNode = context.depsNode<TrackingDepsNode>(listen: true);

    final trackingHolder = trackingDepsNode.trackingHolder;
    final trackingPresenter = trackingDepsNode.trackingPresenter;

    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            child: SputnikMap(),
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
