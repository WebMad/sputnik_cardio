import 'package:sputnik_auth/src/models/auth_state.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_auth/src/models/user.dart';

class AuthStateHolder extends StateHolder<AuthState> {
  AuthStateHolder() : super(const AuthState.none());

  void authed({
    required User user,
  }) =>
      state = AuthState.authorized(
        user: user,
      );

  void notAuthed() => state = const AuthState.unauthorized();
}
