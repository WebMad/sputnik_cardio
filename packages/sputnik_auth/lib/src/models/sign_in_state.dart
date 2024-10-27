import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.freezed.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState.filling() = _Filling;

  const factory SignInState.error({
    required Set<SignInError> errors,
  }) = _Error;

  const factory SignInState.signedIn() = _SignedIn;
}

extension SignInStateEx on SignInState {
  bool hasError(SignInError error) => maybeMap(
        error: (errorState) => errorState.errors.contains(error),
        orElse: () => false,
      );

  bool get hasNoErrors => maybeMap(
        error: (value) => (value.errors.isEmpty ||
            value.errors.length == 1 &&
                (value.errors.contains(SignInError.unknownError) ||
                    value.errors.contains(SignInError.invalidPasswordOrEmail))),
        orElse: () => true,
      );
}

enum SignInError {
  unknownError,
  invalidEmail,
  invalidPassword,
  invalidPasswordOrEmail,
}
