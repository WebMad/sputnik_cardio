import 'package:flutter/material.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_auth/sputnik_auth.dart';
import 'package:sputnik_cardio/src/common/app_scope_deps_node.dart';
import 'package:sputnik_cardio/src/features/auth/auth_deps_node.dart';
import 'package:sputnik_cardio/src/features/auth/auth_scope_deps_node.dart';

class AuthViewScreen extends StatelessWidget {
  const AuthViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = DepsNodeBinder.of<AppScopeDepsNode>(context)
        .authDepsNode()
        .authController();

    return AuthScreen(authController: authController);
  }
}
