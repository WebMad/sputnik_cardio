import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:sputnik_di/sputnik_di.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import 'models/user.dart';
import 'state_holders/auth_state_holder.dart';

class AuthManager extends Lifecycle {
  final supabase.SupabaseClient _supabaseClient;
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

      if (isAuthed) {
        _authStateHolder.authed(
          user: User(
            uuid: user.id,
            email: user.email ?? "Undefined email",
          ),
        );
        return;
      }
    } on Object catch (e, st) {
      /// TODO: add analytics
    }

    _authStateHolder.notAuthed();
  }

  void logout() {
    try {
      _supabaseClient.auth.signOut();

      _authStateHolder.notAuthed();
    } on Object catch (e, st) {
      /// TODO: create analytics
    }
  }
}
