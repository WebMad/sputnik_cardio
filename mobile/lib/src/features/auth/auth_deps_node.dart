import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sputnik_auth/sputnik_auth.dart';
import 'package:sputnik_cardio/src/common/navigation_deps_node.dart';
import 'package:sputnik_cardio/src/features/auth/auth_handler.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../app_settings/state_holders/app_settings_state_holder.dart';
import 'auth_scope_deps_node.dart';
import 'auth_settings_provider_impl.dart';

class AuthDepsNode extends DepsNode {
  final NavigationDepsNode _navigationDepsNode;
  final AuthScopeDepsNode _authScopeDepsNode;
  final GoogleSignIn _googleSignIn;
  final AppSettingsStateHolder _appSettingsStateHolder;

  AuthDepsNode(
    this._navigationDepsNode,
    this._authScopeDepsNode,
    this._googleSignIn,
    this._appSettingsStateHolder,
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

  late final _authSettingsProvider = bind(
    () => AuthSettingsProviderImpl(
      _appSettingsStateHolder,
    ),
  );

  late final authController = bind(
    () => AuthController(
      Supabase.instance.client,
      _googleSignIn,
      _authSettingsProvider(),
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
