import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/auth/auth_di.dart';

import 'app_initialize_manager.dart';
import 'app_initialize_state_holder.dart';

class AppDepsNode extends DepsNode {
  final AuthDi _authDi;

  late final appScope = bind(() => <Lifecycle>[
        _authDi.authController,
        _authDi.authHandler,
      ]);

  late final appInitializeManager = bind(
    () => AppInitializeManager(
      appInitializeStateHolder,
      depsWithLifecycle: appScope,
      disposableDeps: [
        appInitializeStateHolder,
      ],
      intializableDeps: [],
    ),
  );

  late final appInitializeStateHolder = bind(
    () => AppInitializeStateHolder(),
  );

  AppDepsNode(this._authDi);
}
