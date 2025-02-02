import 'dart:async';

import 'package:sputnik_auth/src/auth_di.dart';
import 'package:sputnik_auth/src/models/auth_state.dart';
import 'package:sputnik_di/sputnik_di.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

class AuthController implements Lifecycle {
  AuthDepsNode? __depsNode;

  final supabase.SupabaseClient _supabaseClient;

  AuthController(
    this._supabaseClient,
  );

  AuthDepsNode get depsNode {
    final depsNode = __depsNode;

    if (depsNode == null) {
      throw Exception('controller is not initialized yet');
    }

    return depsNode;
  }

  AuthState get authState => depsNode.authStateHolderDep().state;

  Stream<AuthState> get authStateStream =>
      depsNode.authStateHolderDep().asStream;

  @override
  Future<void> init() async {
    __depsNode = AuthDepsNode(_supabaseClient);
    await __depsNode?.init();
  }

  @override
  Future<void> dispose() async {
    await __depsNode?.dispose();
    __depsNode = null;
  }
}
