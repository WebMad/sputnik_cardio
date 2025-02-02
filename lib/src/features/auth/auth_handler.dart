import 'dart:async';

import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_auth/sputnik_auth.dart';
import 'package:sputnik_cardio/src/common/navigation_manager.dart';
import 'package:sputnik_cardio/src/features/auth/auth_scope_deps_node.dart';

class AuthHandler implements Lifecycle {
  final AuthController _authController;
  final NavigationManager _navigationManager;
  final AuthScopeDepsNode _authScopeDepsNode;

  StreamSubscription<AuthState>? _sub;

  AuthHandler(
    this._authController,
    this._navigationManager,
    this._authScopeDepsNode,
  );

  @override
  Future<void> init() async {
    _sub = _authController.authStateStream.listen(
      (event) {
        event.mapOrNull(
          unauthorized: (value) {
            _navigationManager.openAuthPage();
            _authScopeDepsNode.dispose();
          },
          authorized: (value) {
            _authScopeDepsNode.init();
            _navigationManager.openMainPage();
          },
        );
      },
    );
  }

  @override
  Future<void> dispose() async {
    if (_authScopeDepsNode.status == DepsNodeStatus.initialized) {
      await _authScopeDepsNode.dispose();
    }

    await _sub?.cancel();
    _sub = null;
  }
}
