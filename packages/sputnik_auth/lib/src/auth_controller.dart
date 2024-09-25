import 'dart:async';

import 'package:sputnik_auth/src/auth_data_source/auth_data_source_di.dart';
import 'package:sputnik_auth/src/auth_di.dart';
import 'package:sputnik_auth/src/models/auth_state.dart';
import 'package:sputnik_auth/src/auth_state_holder.dart';
import 'package:sputnik_di/sputnik_di.dart';

class AuthController implements Lifecycle {
  AuthDi? __depsNode;

  AuthDi get _depsNode {
    final depsNode = __depsNode;

    if (depsNode == null) {
      throw Exception('controller is not initialized yet');
    }

    return depsNode;
  }

  AuthState get authState => _depsNode.authStateHolder.state;

  Stream<AuthState> get authStateStream => _depsNode.authStateHolder.asStream;

  @override
  FutureOr<void> init() {
    final authDataSourceDi = SupabaseAuthDataSourceDi();
    __depsNode = AuthDi(
      authDataSourceDi,
    );
  }

  @override
  FutureOr<void> dispose() {
    __depsNode = null;
  }
}
