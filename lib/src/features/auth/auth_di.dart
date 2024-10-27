import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_auth/sputnik_auth.dart';
import 'package:sputnik_cardio/src/common/navigation_deps_node.dart';
import 'package:sputnik_cardio/src/features/auth/auth_handler.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthDi extends DepsNode {
  final NavigationDepsNode _navigationDepsNode;

  late final authController = bind(
    () => AuthController(
      Supabase.instance.client,
    ),
  );

  late final authHandler = bind(
    () => AuthHandler(
      authController,
      _navigationDepsNode.navigationManager,
    ),
  );

  AuthDi(this._navigationDepsNode);
}
