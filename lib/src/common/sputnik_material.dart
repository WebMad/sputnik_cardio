import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_auth/sputnik_auth.dart';
import 'package:sputnik_cardio/src/common/app_scope_deps_node.dart';
import 'package:sputnik_cardio/src/common/navigation_deps_node.dart';
import 'package:sputnik_cardio/src/features/auth/auth_scope_deps_node.dart';
import 'package:sputnik_localization/sputnik_localization.dart';

import '../features/auth/auth_deps_node.dart';
import '../features/auth/auth_view_screen.dart';
import '../features/workout_recording/screens/pending_workouts_screen.dart';
import 'sputnik_main.dart';

class SputnikMaterial extends StatefulWidget {
  const SputnikMaterial({super.key});

  @override
  State<SputnikMaterial> createState() => _SputnikMaterialState();
}

class _SputnikMaterialState extends State<SputnikMaterial> {
  @override
  Widget build(BuildContext context) {
    final appScope = DepsNodeBinder.of<AppScopeDepsNode>(context);
    final navigationManager = appScope.navigationDepsNode().navigationManager();

    return DepsNodeBinder<AuthScopeDepsNode>(
      depsNode: () => appScope.authScopeDepsNode(),
      child: MaterialApp(
        title: 'Flutter Demo',
        navigatorKey: navigationManager.navigatorKey,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('ru'),
        ],
        initialRoute: navigationManager.initialPage,
        routes: {
          '/': (context) => const SputnikMain(),
          '/auth': (context) => const AuthViewScreen(),
          PendingWorkoutsScreen.routeName: (context) => DepsNodeBinder(
                depsNode: () => appScope.authScopeDepsNode().workoutDepsNode(),
                child: const PendingWorkoutsScreen(),
              ),
        },
      ),
    );
  }
}
