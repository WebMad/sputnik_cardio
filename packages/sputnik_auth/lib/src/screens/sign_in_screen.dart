import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_auth/src/models/sign_in_state.dart';
import 'package:sputnik_localization/sputnik_localization.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../auth_deps_node.dart';

class SignInScreen extends StatefulWidget {
  final VoidCallback onSignUpPressed;
  final String privacyPolicyLink;
  final String personalDataLink;

  const SignInScreen({
    super.key,
    required this.onSignUpPressed,
    required this.privacyPolicyLink,
    required this.personalDataLink,
  });

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
    final signInStateHolder = authDi.signInStateHolder();
    final signInManager = authDi.signInManager();

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
                SignInButton(
                  Buttons.Google,
                  onPressed: () {
                    signInManager.signInViaGoogle();
                  },
                ),
                SizedBox(height: puk(1)),
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
                SizedBox(height: puk(4)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SpukiText(
                        'Продолжая, вы подтверждаете согласие с Политикой конфиденциальности и условиями обработки персональных данных',
                      ),
                      SizedBox(height: puk(2)),
                      GestureDetector(
                        onTap: () =>
                            launchUrl(Uri.parse(widget.privacyPolicyLink)),
                        child: const SpukiText.link(
                          "- Политика конфиденциальности",
                          textAlign: TextAlign.left,
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            launchUrl(Uri.parse(widget.personalDataLink)),
                        child: const SpukiText.link(
                          "- Согласие на обработку персональных данных",
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: puk(4)),
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
