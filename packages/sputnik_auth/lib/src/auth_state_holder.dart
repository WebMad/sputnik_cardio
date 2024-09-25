import 'package:sputnik_auth/src/models/auth_state.dart';
import 'package:sputnik_di/sputnik_di.dart';

class AuthStateHolder extends StateHolder<AuthState> {
  AuthStateHolder() : super(const AuthState.none());
}
