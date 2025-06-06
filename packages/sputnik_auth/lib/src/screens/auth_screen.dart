import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_auth/src/auth_controller.dart';
import 'package:sputnik_auth/src/auth_deps_node.dart';
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
        final authDepsNode = DepsNodeBinder.of<AuthDepsNode>(context);
        final authStateHolder = authDepsNode.authStateHolder();

        return StateHolderListener<AuthStateHolder, AuthState>(
          listener: (data) {
            data.mapOrNull(
              authorized: (value) {
                print(1234);
              },
            );
          },
          holder: authStateHolder,
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
                        return StreamBuilder<Object>(
                            stream: authDepsNode
                                .authSettingsProvider.authSettingsStream,
                            builder: (context, snapshot) {
                              return isSignInScreen
                                  ? SignInScreen(
                                      onSignUpPressed: () {
                                        setState(() {
                                          isSignInScreen = false;
                                        });
                                      },
                                      privacyPolicyLink: authDepsNode
                                          .authSettingsProvider
                                          .authSettings
                                          .privacyPolicy,
                                      personalDataLink: authDepsNode
                                          .authSettingsProvider
                                          .authSettings
                                          .personalData,
                                    )
                                  : SignUpScreen(
                                      onSignInPressed: () {
                                        setState(() {
                                          isSignInScreen = true;
                                        });
                                      },
                                      privacyPolicyLink: authDepsNode
                                          .authSettingsProvider
                                          .authSettings
                                          .privacyPolicy,
                                      personalDataLink: authDepsNode
                                          .authSettingsProvider
                                          .authSettings
                                          .personalData,
                                    );
                            });
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
