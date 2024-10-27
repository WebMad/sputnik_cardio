import 'dart:async';

import 'package:sputnik_auth/src/auth_state_holder.dart';
import 'package:sputnik_di/sputnik_di.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthManager extends Lifecycle {
  final SupabaseClient _supabaseClient;
  final AuthStateHolder _authStateHolder;

  AuthManager(
    this._authStateHolder,
    this._supabaseClient,
  );

  @override
  FutureOr<void> init() {
    // ignore: unawaited_futures
    checkAuth();
  }

  @override
  FutureOr<void> dispose() {}

  Future<void> checkAuth() async {
    bool isAuthed = false;
    try {
      final user = (await _supabaseClient.auth.getUser()).user;
      isAuthed = user != null;
    } on Object catch (e, st) {
      /// TODO: add analytics
    }

    if (isAuthed) {
      _authStateHolder.authed();
      return;
    }

    _authStateHolder.notAuthed();
  }
}
