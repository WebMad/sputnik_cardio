import 'package:sputnik_auth/src/models/sign_up_state.dart';
import 'package:sputnik_auth/src/sign_in/sign_in_manager.dart';
import 'package:sputnik_auth/src/sign_up/sign_up_state_holder.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import '../auth_manager.dart';

class SignUpManager {
  final supabase.SupabaseClient _supabaseClient;
  final AuthManager _authManager;
  final SignInManager _signInManager;
  final SignUpStateHolder _signUpStateHolder;

  const SignUpManager(
    this._supabaseClient,
    this._authManager,
    this._signUpStateHolder,
    this._signInManager,
  );

  bool validateRepeatPassword(String password, String repeatPassword) {
    if (password != repeatPassword) {
      _signUpStateHolder.addError(SignUpError.passwordDontMatch);
      return false;
    }

    _signUpStateHolder.removeError(SignUpError.passwordDontMatch);

    return true;
  }

  bool validateEmail(String email) {
    final isEmailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);

    if (!isEmailValid) {
      _signUpStateHolder.addError(SignUpError.invalidEmail);

      return false;
    }

    _signUpStateHolder.removeError(SignUpError.invalidEmail);

    return true;
  }

  bool validatePassword(String password) {
    final isPasswordValid = password.length >= 6 && password.length <= 64;

    if (!isPasswordValid) {
      _signUpStateHolder.addError(SignUpError.invalidPassword);

      return false;
    }

    _signUpStateHolder.removeError(SignUpError.invalidPassword);

    return true;
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String repeatPassword,
  }) async {
    if (!validateRepeatPassword(password, repeatPassword) ||
        !validateEmail(email) ||
        !validatePassword(password)) {
      return;
    }
    try {
      final authResponse = await _supabaseClient.auth.signUp(
        email: email,
        password: password,
      );

      final user = authResponse.user;

      if (user == null) {
        _signUpStateHolder.update(
          const SignUpState.error(
            errors: {SignUpError.unknownError},
          ),
        );
        return;
      }

      _signUpStateHolder.update(const SignUpState.created());

      await _signInManager.signIn(email: email, password: password);
    } on Object catch (e, st) {
      _signUpStateHolder.update(
        const SignUpState.error(
          errors: {SignUpError.unknownError},
        ),
      );
    }
  }
}
