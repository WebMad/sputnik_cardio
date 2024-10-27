import 'dart:async';

import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_auth/sputnik_auth.dart';
import 'package:sputnik_cardio/src/common/app_initialize_state_holder.dart';

class AppInitializeManager implements Lifecycle {
  final AppInitializeStateHolder _appInitializeStateHolder;
  final List<Lifecycle> depsWithLifecycle;
  final List<Disposable> disposableDeps;
  final List<Initializable> intializableDeps;

  const AppInitializeManager(
    this._appInitializeStateHolder, {
    required this.depsWithLifecycle,
    required this.disposableDeps,
    required this.intializableDeps,
  });

  @override
  FutureOr<void> init() async {
    for (final depWithLifecycle in depsWithLifecycle) {
      try {
        await depWithLifecycle.init();
      } on Object catch (e, st) {
        print('Deps initialize error');
        print(e);
        print(st);
      }
    }

    for (final intializableDep in intializableDeps) {
      try {
        await intializableDep.init();
      } on Object catch (e, st) {
        print('Deps initialize error');
        print(e);
        print(st);
      }
    }

    _appInitializeStateHolder.initialized();
  }

  @override
  FutureOr<void> dispose() async {
    _appInitializeStateHolder.disposed();

    for (final disposableDep in disposableDeps) {
      try {
        await disposableDep.dispose();
      } on Object catch (e, st) {
        print('Deps dispose error');
        print(e);
        print(st);
      }
    }

    for (final depWithLifecycle in depsWithLifecycle.reversed) {
      try {
        await depWithLifecycle.dispose();
      } on Object catch (e, st) {
        print('Deps dispose error');
        print(e);
        print(st);
      }
    }
  }
}
