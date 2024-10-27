import 'package:sputnik_auth/src/models/auth_state.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';

class AuthStateHolder extends StateHolder<AuthState> {
  AuthStateHolder() : super(const AuthState.none());

  void authed() => state = const AuthState.authorized();

  void notAuthed() => state = const AuthState.unauthorized();
}
