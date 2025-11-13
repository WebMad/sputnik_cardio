import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';

import '../models/sign_up_state.dart';

class SignUpStateHolder extends StateHolder<SignUpState> {
  SignUpStateHolder() : super(const SignUpState.filling());

  void update(SignUpState signUpState) {
    state = signUpState;
  }

  void addError(SignUpError error) {
    update(
      state.maybeMap(
        error: (errorState) => errorState.copyWith(
          errors: {error, ...errorState.errors},
        ),
        orElse: () => SignUpState.error(
          errors: {error},
        ),
      ),
    );
  }

  void removeError(SignUpError error) {
    update(
      state.maybeMap(
        error: (errorState) {
          if (errorState.errors.length == 1 && errorState.hasError(error)) {
            return const SignUpState.filling();
          }

          return errorState.copyWith(
            errors: {...errorState.errors}..remove(error),
          );
        },
        orElse: () => state,
      ),
    );
  }
}
