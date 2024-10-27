import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_auth/sputnik_auth.dart';
import 'package:sputnik_cardio/src/common/app_deps_node.dart';
import 'package:sputnik_cardio/src/common/navigation_deps_node.dart';
import 'package:sputnik_cardio/src/common/stream_listener.dart';
import 'package:sputnik_localization/sputnik_localization.dart';

import '../features/auth/auth_di.dart';
import '../features/auth/auth_view_screen.dart';
import 'sputnik_main.dart';

class SputnikMaterial extends StatefulWidget {
  const SputnikMaterial({super.key});

  @override
  State<SputnikMaterial> createState() => _SputnikMaterialState();
}

class _SputnikMaterialState extends State<SputnikMaterial> {
  @override
  Widget build(BuildContext context) {
    final appInitializeStateHolder =
        DepsNodeBinder.of<AppDepsNode>(context).appInitializeStateHolder;

    final navigationManager =
        DepsNodeBinder.of<NavigationDepsNode>(context).navigationManager;

    return StreamBuilder(
      initialData: appInitializeStateHolder.state,
      stream: appInitializeStateHolder.stream,
      builder: (context, snapshot) {
        final isInitialized = snapshot.requireData;

        return isInitialized
            ? Builder(
                builder: (context) {
                  final authController =
                      DepsNodeBinder.of<AuthDi>(context).authController;
                  final authStateStream = authController.authStateStream;

                  return MaterialApp(
                    navigatorKey: navigationManager.navigatorKey,
                    title: 'Flutter Demo',
                    theme: ThemeData(
                      colorScheme:
                          ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
                    },
                  );
                },
              )
            : const MaterialApp(
                home: Scaffold(
                  body: Center(
                    child: Text('Загрузка...'),
                  ),
                ),
              );
      },
    );
  }
}
