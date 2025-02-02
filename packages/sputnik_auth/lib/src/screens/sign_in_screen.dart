import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_auth/src/models/sign_in_state.dart';
import 'package:sputnik_localization/sputnik_localization.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';

import '../auth_di.dart';

class SignInScreen extends StatefulWidget {
  final VoidCallback onSignUpPressed;

  const SignInScreen({super.key, required this.onSignUpPressed});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passController;

  bool get isAllFilled =>
      _emailController.text.isNotEmpty && _passController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController();
    _passController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final theme = SpukiTheme.of(context);
    final puk = theme.puk;

    final authDi = DepsNodeBinder.of<AuthDepsNode>(context);
    final signInStateHolder = authDi.signInStateHolderDep();
    final signInManager = authDi.signInManagerDep();

    return StreamBuilder<SignInState>(
        initialData: signInStateHolder.state,
        stream: signInStateHolder.stream,
        builder: (context, snapshot) {
          final signInState = snapshot.requireData;

          return SizedBox(
            width: MediaQuery.of(context).size.width * .8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                const SpukiText.h1('Sign in'),
                SizedBox(height: puk(2)),
                if (signInState.hasError(SignInError.unknownError)) ...[
                  SpukiText.custom(
                    context.tr.unknownSignInError,
                    spukiFontData:
                        theme.spukiFont.regular.copyWith(color: Colors.red),
                  ),
                  SizedBox(height: puk(1)),
                ],
                SpukiTextField(
                  key: const ValueKey('email'),
                  placeholder: 'Email',
                  controller: _emailController,
                  onChanged: (value) {
                    signInManager.validateEmail(_emailController.text);
                    setState(() {});
                  },
                ),
                if (signInState.hasError(SignInError.invalidEmail))
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SpukiText.custom(
                      context.tr.invalidEmail,
                      spukiFontData:
                          theme.spukiFont.regular.copyWith(color: Colors.red),
                    ),
                  ),
                SizedBox(height: puk(1)),
                SpukiTextField(
                  key: const ValueKey('password'),
                  placeholder: 'Password',
                  obscureText: true,
                  controller: _passController,
                  onChanged: (value) {
                    signInManager.validatePassword(_passController.text);
                    setState(() {});
                  },
                ),
                if (signInState.hasError(SignInError.invalidPassword))
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SpukiText.custom(
                      context.tr.invalidPassword,
                      spukiFontData:
                          theme.spukiFont.regular.copyWith(color: Colors.red),
                    ),
                  ),
                SizedBox(height: puk(2)),
                SpukiButton(
                  onPressed: isAllFilled && signInState.hasNoErrors
                      ? () {
                          signInManager.signIn(
                            email: _emailController.text,
                            password: _passController.text,
                          );
                        }
                      : null,
                  child: const SpukiText('Submit'),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SpukiText('Already have account? '),
                    GestureDetector(
                      onTap: () {
                        widget.onSignUpPressed();
                      },
                      child: const SpukiText.link('Sign Up'),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          );
        });
  }
}
