import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sputnik_auth/src/auth_controller.dart';
import 'package:sputnik_auth/src/auth_wrapper.dart';
import 'package:sputnik_localization/sputnik_localization.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';

import '../auth_di.dart';

class ProfileScreen extends StatelessWidget {
  final AuthController authController;

  const ProfileScreen({
    super.key,
    required this.authController,
  });

  @override
  Widget build(BuildContext context) {
    return AuthWrapper(
      authController: authController,
      builder: (context) {
        final authDepsNode = DepsNodeBinder.of<AuthDepsNode>(context);

        final authStateHolder = authDepsNode.authStateHolderDep();

        final theme = SpukiTheme.of(context);

        return SpukiScaffold(
          body: SafeArea(
            child: authStateHolder.state.map(
              none: (state) => Center(
                child: Text(
                  context.tr.unknownAuthState,
                ),
              ),
              unauthorized: (state) => Column(
                children: [
                  SizedBox(height: theme.puk(2)),
                  SpukiText(
                    context.tr.unknownAuthState,
                  ),
                ],
              ),
              authorized: (state) => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: theme.puk(2),

                    /// Надо чтобы растянуть контейнер по ширине и блоки
                    /// внутри Column корректно выравнивались
                    width: double.infinity,
                  ),
                  SpukiText.h3(
                    state.user.map(
                      (state) => state.email,
                      guest: (_) => context.tr.guest,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: theme.puk(4)),
                  SpukiButton(
                    onPressed: () {
                      authDepsNode.authManagerDep().logout();
                    },
                    child: SpukiText(context.tr.logout),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
