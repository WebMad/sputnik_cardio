import 'dart:async';

import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_auth/sputnik_auth.dart';
import 'package:sputnik_cardio/src/common/navigation_manager.dart';

class AuthHandler implements Lifecycle {
  final AuthController _authController;
  final NavigationManager _navigationManager;

  StreamSubscription<AuthState>? _sub;

  AuthHandler(
    this._authController,
    this._navigationManager,
  );

  @override
  FutureOr<void> init() {
    _sub = _authController.authStateStream.listen(
      (event) {
        event.mapOrNull(
          unauthorized: (value) => _navigationManager.openAuthPage(),
          authorized: (value) => _navigationManager.openMainPage(),
        );
      },
    );
  }

  @override
  FutureOr<void> dispose() async {
    await _sub?.cancel();
    _sub = null;
  }
}
