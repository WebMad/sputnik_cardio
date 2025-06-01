import 'dart:async';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:sputnik_auth/sputnik_auth.dart';
import 'package:sputnik_auth/src/auth_deps_node.dart';
import 'package:sputnik_auth/src/models/auth_state.dart';
import 'package:sputnik_di/sputnik_di.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

class AuthController implements Lifecycle {
  AuthDepsNode? __depsNode;

  final supabase.SupabaseClient _supabaseClient;
  final GoogleSignIn _googleSignIn;
  final AuthSettingsProvider _authSettingsProvider;

  AuthController(
    this._supabaseClient,
    this._googleSignIn,
    this._authSettingsProvider,
  );

  AuthDepsNode get depsNode {
    final depsNode = __depsNode;

    if (depsNode == null) {
      throw Exception('controller is not initialized yet');
    }

    return depsNode;
  }

  AuthState get authState => depsNode.authStateHolder().state;

  Stream<AuthState> get authStateStream => depsNode.authStateHolder().asStream;

  @override
  Future<void> init() async {
    __depsNode = AuthDepsNode(
      _supabaseClient,
      _googleSignIn,
      _authSettingsProvider,
    );
    await __depsNode?.init();
  }

  void logout() {
    depsNode.authManager().logout();
  }

  @override
  Future<void> dispose() async {
    await __depsNode?.dispose();
    __depsNode = null;
  }
}
