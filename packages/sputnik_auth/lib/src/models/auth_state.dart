import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'user.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.none() = _NoneAuthState;

  const factory AuthState.unauthorized() = _UnauthorizedAuthState;

  const factory AuthState.authorized({
    required User user,
  }) = _AuthorizedAuthState;
}
