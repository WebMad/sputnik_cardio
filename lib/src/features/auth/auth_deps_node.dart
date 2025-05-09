import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sputnik_auth/sputnik_auth.dart';
import 'package:sputnik_cardio/src/common/navigation_deps_node.dart';
import 'package:sputnik_cardio/src/features/auth/auth_handler.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'auth_scope_deps_node.dart';

class AuthDepsNode extends DepsNode {
  final NavigationDepsNode _navigationDepsNode;
  final AuthScopeDepsNode _authScopeDepsNode;
  final GoogleSignIn _googleSignIn;

  AuthDepsNode(
    this._navigationDepsNode,
    this._authScopeDepsNode,
    this._googleSignIn,
  );

  @override
  List<Set<LifecycleDependency>> get initializeQueue => [
        {
          authController,
        },
        {
          authHandler,
        },
      ];

  late final authController = bind(
    () => AuthController(
      Supabase.instance.client,
      _googleSignIn,
    ),
  );

  late final authHandler = bind(
    () => AuthHandler(
      authController(),
      _navigationDepsNode.navigationManager(),
      _authScopeDepsNode,
    ),
  );
}
