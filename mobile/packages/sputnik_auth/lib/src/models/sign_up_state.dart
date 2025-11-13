import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.filling() = _Filling;

  const factory SignUpState.error({
    required Set<SignUpError> errors,
  }) = _Error;

  const factory SignUpState.created() = _Created;
}

extension SignUpStateEx on SignUpState {
  bool hasError(SignUpError error) => maybeMap(
        error: (errorState) => errorState.errors.contains(error),
        orElse: () => false,
      );

  bool get hasNoErrors => maybeMap(
        error: (value) => (value.errors.isEmpty ||
            value.errors.length == 1 &&
                value.errors.contains(SignUpError.unknownError)),
        orElse: () => true,
      );
}

enum SignUpError {
  invalidEmail,
  invalidPassword,
  passwordDontMatch,
  unknownError,
}
