import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/common/app_deps_node.dart';
import 'package:sputnik_cardio/src/common/consts.dart';
import 'package:sputnik_cardio/src/common/navigation_deps_node.dart';
import 'package:sputnik_cardio/src/features/auth/auth_di.dart';
import 'package:sputnik_cardio/src/common/app_initialize_wrapper.dart';
import 'package:sputnik_cardio/src/features/maps/maps_deps_node.dart';
import 'package:sputnik_cardio/src/features/tracking/tracking_deps_node.dart';
import 'package:sputnik_cardio/src/features/workout_recording/realtime_metrics_deps_node.dart';
import 'package:sputnik_cardio/src/features/workout_recording/workout_lifecycle_deps_node.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import 'src/common/sputnik_material.dart';

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
  late final _navigationDepsNode = NavigationDepsNode();
  late final _authDi = AuthDi(_navigationDepsNode);
  late final _trackingDataDepsNode = TrackingDataDepsNode();
  late final _locationDepsNode = LocationDepsNode();
  late final _workoutLifecycleDepsNode = WorkoutLifecycleDepsNode(
    _trackingDataDepsNode,
    _locationDepsNode,
    _authDi,
  );

  late final _trackingDepsNode = TrackingDepsNode(
    _trackingDataDepsNode,
    _locationDepsNode,
    _workoutLifecycleDepsNode,
  );
  late final _appDepsNode = AppDepsNode(_authDi);
  late final _mapsDepsNode = MapsDepsNode(_locationDepsNode);

  @override
  void initState() {
    super.initState();

    _mapsDepsNode.init();
  }

  @override
  void dispose() {
    _mapsDepsNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = brightness == Brightness.light;

    return DepsNodeBinder(
      depsNode: () => _navigationDepsNode,
      child: DepsNodeBinder(
        depsNode: () => _trackingDepsNode,
        child: DepsNodeBinder(
          depsNode: () => _authDi,
          child: DepsNodeBinder(
            depsNode: () => _appDepsNode,
            child: DepsNodeBinder(
              depsNode: () => _workoutLifecycleDepsNode,
              child: DepsNodeBinder(
                depsNode: () => _trackingDataDepsNode,
                child: DepsNodeBinder(
                  depsNode: () => _locationDepsNode,
                  child: DepsNodeBinder(
                    depsNode: () => _mapsDepsNode,
                    child: SpukiTheme(
                      spukiThemeData: isLightMode
                          ? const SpukiThemeData.light()
                          : const SpukiThemeData.dark(),
                      child: const AppInitializeWrapper(
                        child: SputnikMaterial(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
