import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_auth/sputnik_auth.dart';
import 'package:sputnik_auth/src/auth_wrapper.dart';
import 'package:sputnik_localization/sputnik_localization.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';

import '../auth_deps_node.dart';

class ProfileScreen extends StatelessWidget {
  final AuthController authController;
  final Widget Function(
    BuildContext context,
    AuthorizedAuthState state,
  ) authorizedBuilder;

  const ProfileScreen({
    super.key,
    required this.authController,
    required this.authorizedBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return AuthWrapper(
      authController: authController,
      builder: (context) {
        final authDepsNode = DepsNodeBinder.of<AuthDepsNode>(context);

        final authStateHolder = authDepsNode.authStateHolder();

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
              authorized: (state) => authorizedBuilder(context, state),
            ),
          ),
        );
      },
    );
  }
}
