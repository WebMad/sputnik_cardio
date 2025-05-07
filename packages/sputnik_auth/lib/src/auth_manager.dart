import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import 'models/user.dart';
import 'state_holders/auth_state_holder.dart';

class AuthManager extends Lifecycle {
  final supabase.SupabaseClient _supabaseClient;
  final AuthStateHolder _authStateHolder;
  final Connectivity _connectivity;

  AuthManager(
    this._authStateHolder,
    this._supabaseClient,
    this._connectivity,
  );

  @override
  Future<void> init() async {
    // ignore: unawaited_futures
    checkAuth();
  }

  @override
  Future<void> dispose() async {}

  Future<void> checkAuth() async {
    bool isAuthed = false;
    try {
      final connectivityCheck = await _connectivity.checkConnectivity();

      final hasInternetConnection = connectivityCheck.toSet().intersection({
        ConnectivityResult.ethernet,
        ConnectivityResult.mobile,
        ConnectivityResult.wifi,
      }).isNotEmpty;

      if (!hasInternetConnection) {
        await _retriveLocalSession();
        return;
      }

      await _supabaseClient.auth.refreshSession();

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
    } on supabase.AuthRetryableFetchException {
      await _retriveLocalSession();
    } on Object catch (e, st) {
      /// TODO: add analytics
    }

    _authStateHolder.notAuthed();
  }

  Future<void> _retriveLocalSession() async {
    final currentUser = _supabaseClient.auth.currentUser;

    if (currentUser != null) {
      _authStateHolder.authed(
        user: User(
          uuid: currentUser.id,
          email: currentUser.email ?? "Undefined email",
        ),
      );

      return;
    }

    _authStateHolder.notAuthed();
  }

  Future<void> logout() async {
    try {
      await _supabaseClient.auth.signOut();
    } on Object catch (e, st) {
      /// TODO: create analytics
    } finally {
      _authStateHolder.notAuthed();
    }
  }
}
