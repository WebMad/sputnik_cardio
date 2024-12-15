import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_auth/src/auth_controller.dart';
import 'package:sputnik_auth/src/auth_di.dart';
import 'package:sputnik_auth/src/auth_wrapper.dart';
import 'package:sputnik_auth/src/screens/sign_in_screen.dart';
import 'package:sputnik_auth/src/screens/sign_up_screen.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';

import '../models/auth_state.dart';
import '../state_holders/auth_state_holder.dart';

class AuthScreen extends StatefulWidget {
  final AuthController authController;

  const AuthScreen({
    super.key,
    required this.authController,
  });

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isSignInScreen = true;

  @override
  Widget build(BuildContext context) {
    final puk = SpukiTheme.of(context).puk;

    return AuthWrapper(
      authController: widget.authController,
      builder: (context) {
        final authStateHolder =
            DepsNodeBinder.of<AuthDepsNode>(context).authStateHolder;

        return StateHolderListener<AuthStateHolder, AuthState>(
          listener: (data) {
            data.mapOrNull(
              authorized: (value) {
                print(1234);
              },
            );
          },
          stateHolder: authStateHolder,
          child: SpukiScaffold(
            body: Center(
              child: StreamBuilder(
                  initialData: authStateHolder.state,
                  stream: authStateHolder.stream,
                  builder: (context, snapshot) {
                    final authState = snapshot.requireData;

                    return authState.map(
                      none: (value) => const Column(
                        children: [
                          Spacer(),
                          SpukiText(
                            'Loading. If it lasts too long, write to support.',
                          ),

                          /// TODO: должна быть кнопка поддержки
                          Spacer(),
                        ],
                      ),
                      authorized: (state) => const Column(
                        children: [
                          Spacer(),
                          SpukiText('You are already logged in'),

                          /// TODO: а что тогда делать пользователю?
                          Spacer(),
                        ],
                      ),
                      unauthorized: (state) {
                        return isSignInScreen
                            ? SignInScreen(
                                onSignUpPressed: () {
                                  setState(() {
                                    isSignInScreen = false;
                                  });
                                },
                              )
                            : SignUpScreen(
                                onSignInPressed: () {
                                  setState(() {
                                    isSignInScreen = true;
                                  });
                                },
                              );
                      },
                    );
                  }),
            ),
          ),
        );
      },
    );
  }
}
