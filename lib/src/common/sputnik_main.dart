import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_auth/sputnik_auth.dart';
import 'package:sputnik_cardio/src/common/app_scope_deps_node.dart';
import 'package:sputnik_cardio/src/features/app_settings/models/app_setting.dart';
import 'package:sputnik_cardio/src/features/auth/auth_scope_deps_node.dart';
import 'package:sputnik_cardio/src/features/workout_recording/screens/workout_screen.dart';
import 'package:sputnik_localization/sputnik_localization.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../features/workout_recording/screens/workouts_screen.dart';

class SputnikMain extends StatefulWidget {
  const SputnikMain({super.key});

  @override
  State<SputnikMain> createState() => _SputnikMainState();
}

class _SputnikMainState extends State<SputnikMain> {
  @override
  Widget build(BuildContext context) {
    final authScopeDepsNode = DepsNodeBinder.of<AuthScopeDepsNode>(context);
    final appScopeDepsNode = context.depsNode<AppScopeDepsNode>();
    final authDepsNode = appScopeDepsNode.authDepsNode();
    final authController = authDepsNode.authController();

    final theme = SpukiTheme.of(context);

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
                depsNode: depsNode.locationDepsNode(),
              ),
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
                            ProfileScreen(
                              authController: authController,
                              authorizedBuilder: (context, state) {
                                final appSettingsStateHolder = appScopeDepsNode
                                    .appSettingsDepsNode()
                                    .appSettingsStateHolder();
                                return StreamBuilder<Map<String, AppSetting>>(
                                    initialData: appSettingsStateHolder.state,
                                    stream: appSettingsStateHolder.stream,
                                    builder: (context, snapshot) {
                                      final appSettings = snapshot.requireData;

                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: theme.puk(2),

                                            /// Надо чтобы растянуть контейнер по ширине и блоки
                                            /// внутри Column корректно выравнивались
                                            width: double.infinity,
                                          ),
                                          CircleAvatar(
                                            radius: theme.puk(20),
                                          ),
                                          const SizedBox(height: 10),
                                          SpukiText.h3(
                                            state.user.map(
                                              (state) => state.email,
                                              guest: (_) => context.tr.guest,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: theme.puk(4)),
                                          ListTile(
                                            onTap: () {
                                              final email = appSettings[
                                                  AppSetting.supportEmail];

                                              if (email == null) {
                                                return;
                                              }

                                              launchUrl(Uri.parse(
                                                  "mailto:${email.value}"));
                                            },
                                            title: const SpukiText(
                                              'Поддержка',
                                            ),
                                          ),
                                          ListTile(
                                            onTap: () {
                                              final link = appSettings[
                                                  AppSetting.privacyPolicy];

                                              if (link == null) {
                                                return;
                                              }

                                              launchUrl(Uri.parse(link.value));
                                            },
                                            title: const SpukiText(
                                              'Политика конфиденциальности',
                                            ),
                                          ),
                                          ListTile(
                                            onTap: () {
                                              final link = appSettings[
                                                  AppSetting.personalData];

                                              if (link == null) {
                                                return;
                                              }

                                              launchUrl(Uri.parse(link.value));
                                            },
                                            title: const SpukiText(
                                              'Согласие на обработку персональных данных',
                                            ),
                                          ),
                                          ListTile(
                                            onTap: () {
                                              final email = appSettings[
                                                  AppSetting.supportEmail];

                                              if (email == null) {
                                                return;
                                              }

                                              launchUrl(Uri.parse(
                                                  "mailto:${email.value}"));
                                            },
                                            title: const SpukiText(
                                              'Удаление аккаунта',
                                            ),
                                          ),
                                          const Spacer(),
                                          ListTile(
                                            onTap: () => authDepsNode
                                                .authController()
                                                .logout(),
                                            title: SpukiText(context.tr.logout),
                                          ),
                                        ],
                                      );
                                    });
                              },
                            ),
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
