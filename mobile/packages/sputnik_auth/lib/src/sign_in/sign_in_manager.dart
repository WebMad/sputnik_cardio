import 'package:google_sign_in/google_sign_in.dart';
import 'package:sputnik_auth/src/sign_in/sign_in_state_holder.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import '../auth_manager.dart';
import '../models/sign_in_state.dart';

class SignInManager {
  final supabase.SupabaseClient _supabaseClient;
  final AuthManager _authManager;
  final SignInStateHolder _signInStateHolder;
  final GoogleSignIn _googleSignIn;

  SignInManager(
    this._supabaseClient,
    this._authManager,
    this._signInStateHolder,
    this._googleSignIn,
  );

  bool validateEmail(String email) {
    final isEmailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);

    if (!isEmailValid) {
      _signInStateHolder.addError(SignInError.invalidEmail);

      return false;
    }

    _signInStateHolder.removeError(SignInError.invalidEmail);

    return true;
  }

  bool validatePassword(String password) {
    final isPasswordValid = password.length >= 6 && password.length <= 64;

    if (!isPasswordValid) {
      _signInStateHolder.addError(SignInError.invalidPassword);

      return false;
    }

    _signInStateHolder.removeError(SignInError.invalidPassword);

    return true;
  }

  Future<void> signInViaGoogle() async {
    try {
      final user = await _googleSignIn.signIn();

      final userAuth = await user?.authentication;
      final idToken = userAuth?.idToken;
      final accessToken = userAuth?.accessToken;

      if (userAuth == null || idToken == null || accessToken == null) {
        return;
      }

      final res = await _supabaseClient.auth.signInWithIdToken(
        provider: supabase.OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      if (res.user != null) {
        await _authManager.checkAuth();
      }
    } on Object catch (e, st) {
      print(e);
      print(st);
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      if (!validateEmail(email) || !validatePassword(password)) {
        return;
      }

      final res = await _supabaseClient.auth.signInWithPassword(
        password: password,
        email: email,
      );

      final isAuthed = res.user != null;

      if (isAuthed) {
        await _authManager.checkAuth();
      }
    } on Object catch (e, st) {
      print(1234);

      /// TODO: добавить логирование
    }
  }
}
