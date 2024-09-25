import 'dart:async';

import 'package:sputnik_auth/src/auth_state_holder.dart';
import 'package:sputnik_di/sputnik_di.dart';

import 'auth_data_source/auth_data_source.dart';

class AuthManager extends Lifecycle {
  final AuthStateHolder _authStateHolder;
  final AuthDataSource _authDataSource;

  AuthManager(this._authStateHolder, this._authDataSource);

  @override
  FutureOr<void> init() {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  FutureOr<void> dispose() {
    // TODO: implement dispose
    throw UnimplementedError();
  }
}
