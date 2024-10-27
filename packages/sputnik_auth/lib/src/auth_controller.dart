import 'dart:async';

import 'package:sputnik_auth/src/auth_di.dart';
import 'package:sputnik_auth/src/models/auth_state.dart';
import 'package:sputnik_di/sputnik_di.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

class AuthController implements Lifecycle {
  AuthDi? __depsNode;

  final supabase.SupabaseClient _supabaseClient;

  AuthController(
    this._supabaseClient,
  );

  AuthDi get depsNode {
    final depsNode = __depsNode;

    if (depsNode == null) {
      throw Exception('controller is not initialized yet');
    }

    return depsNode;
  }

  AuthState get authState => depsNode.authStateHolder.state;

  Stream<AuthState> get authStateStream => depsNode.authStateHolder.asStream;

  @override
  FutureOr<void> init() async {
    __depsNode = AuthDi(_supabaseClient);
    await depsNode.authManager.init();
  }

  @override
  FutureOr<void> dispose() async {
    await depsNode.authManager.dispose();
    __depsNode = null;
  }
}
