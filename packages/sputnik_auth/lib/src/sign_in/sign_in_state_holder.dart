import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';

import '../models/sign_in_state.dart';

class SignInStateHolder extends StateHolder<SignInState> {
  SignInStateHolder() : super(const SignInState.filling());

  void update(SignInState newState) {
    state = newState;
  }

  void addError(SignInError error) {
    update(
      state.maybeMap(
        error: (errorState) => errorState.copyWith(
          errors: {error, ...errorState.errors},
        ),
        orElse: () => SignInState.error(
          errors: {error},
        ),
      ),
    );
  }

  void removeError(SignInError error) {
    update(
      state.maybeMap(
        error: (errorState) {
          if (errorState.errors.length == 1 && errorState.hasError(error)) {
            return const SignInState.filling();
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
