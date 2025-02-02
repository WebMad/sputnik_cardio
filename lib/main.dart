import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/common/app_scope_deps_node.dart';
import 'package:sputnik_cardio/src/common/consts.dart';
import 'package:sputnik_cardio/src/common/navigation_deps_node.dart';
import 'package:sputnik_cardio/src/features/tracking/tracking_deps_node.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import 'src/common/sputnik_material.dart';
import 'src/features/auth/auth_deps_node.dart';

Future<void> main() async {
  await supabase.Supabase.initialize(
    url: Consts.supabaseProjectURL,
    anonKey: Consts.supabaseApiKey,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final _appScopeDepsNode = AppScopeDepsNode();

  @override
  void initState() {
    super.initState();

    _appScopeDepsNode.init();
  }

  @override
  void dispose() {
    _appScopeDepsNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = brightness == Brightness.light;

    return MultiDepsNodeBinder(
      depsNodeBinders: [
        DepsNodeBinder.value(depsNode: _appScopeDepsNode),
      ],
      child: SpukiTheme(
        spukiThemeData: isLightMode
            ? const SpukiThemeData.light()
            : const SpukiThemeData.dark(),
        child: DepsNodeBuilder(
          depsNode: _appScopeDepsNode,
          initialized: (context, depsNode) {
            return MultiDepsNodeBinder(
              depsNodeBinders: [
                DepsNodeBinder.value(
                  depsNode: depsNode.locationDepsNode(),
                ),
                DepsNodeBinder.value(
                  depsNode: depsNode.authDepsNode(),
                ),
                DepsNodeBinder.value(
                  depsNode: depsNode.navigationDepsNode(),
                ),
              ],
              child: const SputnikMaterial(),
            );
          },
          orElse: (context, depsNode) => const MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('Загрузка...'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
