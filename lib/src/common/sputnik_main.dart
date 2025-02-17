import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_auth/sputnik_auth.dart';
import 'package:sputnik_cardio/src/common/app_scope_deps_node.dart';
import 'package:sputnik_cardio/src/features/auth/auth_scope_deps_node.dart';
import 'package:sputnik_cardio/src/features/workout_recording/screens/workout_screen.dart';
import 'package:sputnik_localization/sputnik_localization.dart';

import '../features/workout_recording/screens/workouts_screen.dart';

class SputnikMain extends StatefulWidget {
  const SputnikMain({super.key});

  @override
  State<SputnikMain> createState() => _SputnikMainState();
}

class _SputnikMainState extends State<SputnikMain> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authScopeDepsNode = DepsNodeBinder.of<AuthScopeDepsNode>(context);
    final appScopeDepsNode = context.depsNode<AppScopeDepsNode>();
    final authController = appScopeDepsNode.authDepsNode().authController();

    return Scaffold(
      body: DepsNodeBuilder(
        depsNode: authScopeDepsNode,
        orElse: (context, depsNode) => const Center(
          child: Text('Загрузка...'),
        ),
        initialized: (context, depsNode) {
          final workoutDepsNode = authScopeDepsNode.workoutDepsNode();

          return MultiDepsNodeBinder(
            depsNodeBinders: [
              DepsNodeBinder.value(
                depsNode: depsNode.mapsDepsNode(),
              ),
              DepsNodeBinder.value(
                depsNode: workoutDepsNode,
              ),
            ],
            child: DefaultTabController(
              length: 3,
              child: DepsNodeBuilder(
                depsNode: workoutDepsNode,
                initialized: (context, workoutDepsNode) {
                  return Column(
                    children: [
                      Expanded(
                        child: TabBarView(
                          children: [
                            const WorkoutScreen(),
                            const WorkoutsScreen(),
                            ProfileScreen(authController: authController),
                          ],
                        ),
                      ),
                      TabBar(
                        tabs: [
                          Tab(
                            icon: const Icon(Icons.fiber_manual_record),
                            text: context.tr.recordTrain,
                          ),
                          Tab(
                            icon: const Icon(Icons.run_circle_outlined),
                            text: context.tr.workouts,
                          ),
                          Tab(
                            icon: const Icon(Icons.person),
                            text: context.tr.profile,
                          ),
                        ],
                      ),
                    ],
                  );
                },
                orElse: (context, depsNode) => const Center(
                  child: Text('Загрузка...'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
