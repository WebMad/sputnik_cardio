import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_auth/src/models/sign_up_state.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';
import 'package:sputnik_localization/sputnik_localization.dart';

import '../auth_di.dart';

class SignUpScreen extends StatefulWidget {
  final VoidCallback onSignInPressed;

  const SignUpScreen({super.key, required this.onSignInPressed});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passController;
  late final TextEditingController _repeatPassController;

  bool get isAllFilled =>
      _emailController.text.isNotEmpty &&
      _passController.text.isNotEmpty &&
      _repeatPassController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController();
    _passController = TextEditingController();
    _repeatPassController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    _repeatPassController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authDi = DepsNodeBinder.of<AuthDepsNode>(context);

    final signUpStateHolder = authDi.signUpStateHolderDep();
    final signUpManager = authDi.signUpManager();

    final theme = SpukiTheme.of(context);
    final puk = theme.puk;

    return StreamBuilder(
      initialData: signUpStateHolder.state,
      stream: signUpStateHolder.stream,
      builder: (context, snapshot) {
        final signUpState = snapshot.requireData;

        return SizedBox(
          width: MediaQuery.of(context).size.width * .8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              SpukiText.h1(
                context.tr.signUp,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: puk(2)),
              if (signUpState.hasError(SignUpError.unknownError)) ...[
                SpukiText.custom(
                  context.tr.unknownSignUpError,
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
                  signUpManager.validateEmail(_emailController.text);
                  setState(() {});
                },
              ),
              if (signUpState.hasError(SignUpError.invalidEmail))
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
                controller: _passController,
                obscureText: true,
                onChanged: (value) {
                  signUpManager.validatePassword(_passController.text);
                  setState(() {});
                },
              ),
              if (signUpState.hasError(SignUpError.invalidPassword))
                Align(
                  alignment: Alignment.centerLeft,
                  child: SpukiText.custom(
                    context.tr.invalidPassword,
                    spukiFontData:
                        theme.spukiFont.regular.copyWith(color: Colors.red),
                  ),
                ),
              SizedBox(height: puk(1)),
              SpukiTextField(
                key: const ValueKey('repeat_password'),
                placeholder: 'Repeat password',
                controller: _repeatPassController,
                obscureText: true,
                onChanged: (value) {
                  signUpManager.validateRepeatPassword(
                    _passController.text,
                    _repeatPassController.text,
                  );
                  setState(() {});
                },
              ),
              if (signUpState.hasError(SignUpError.passwordDontMatch))
                Align(
                  alignment: Alignment.centerLeft,
                  child: SpukiText.custom(
                    context.tr.passwordDontMatch,
                    spukiFontData:
                        theme.spukiFont.regular.copyWith(color: Colors.red),
                  ),
                ),
              SizedBox(height: puk(2)),
              SpukiButton(
                onPressed: isAllFilled && signUpState.hasNoErrors
                    ? () {
                        signUpManager.signUp(
                          email: _emailController.text,
                          password: _passController.text,
                          repeatPassword: _repeatPassController.text,
                        );
                      }
                    : null,
                child: const SpukiText('Submit'),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SpukiText('${context.tr.alreadyHaveAccount} '),
                  GestureDetector(
                    onTap: () {
                      widget.onSignInPressed();
                    },
                    child: SpukiText.link(context.tr.signIn),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        );
      },
    );
  }
}
