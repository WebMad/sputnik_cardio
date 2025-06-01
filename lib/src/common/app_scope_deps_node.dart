import 'package:flutter/foundation.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/auth/auth_deps_node.dart';
import 'package:sputnik_cardio/src/features/auth/auth_scope_deps_node.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../features/app_settings/app_settings_deps_node.dart';
import '../features/firebase_integration/firebase_integration_deps_node.dart';
import '../features/internet_connection_checker/internet_connection_checker_deps_node.dart';
import '../features/tracking/tracking_deps_node.dart';
import 'managers/shared_prefs_manager.dart';
import 'navigation_deps_node.dart';

class AppScopeDepsNode extends DepsNode {
  @override
  @protected
  List<Set<LifecycleDependency>> get initializeQueue => [
        {
          navigationDepsNode,
          locationDepsNode,
          internetConnectionDepsNode,
          firebaseIntegrationDepsNode,
          sharedPrefsManager,
        },
        {
          appSettingsDepsNode,
        },
        {
          authDepsNode,
        },
      ];

  late final appSettingsDepsNode = bind(
    () => AppSettingsDepsNode(
      internetConnectionDepsNode().internetConnectionCheckerStateHolder(),
      sharedPrefsManager().sharedPreferences,
      Supabase.instance.client,
    ),
  );

  late final authScopeDepsNode = bind(
    () => AuthScopeDepsNode(this),
  );

  late final navigationDepsNode = bind(() => NavigationDepsNode());

  late final authDepsNode = bind(
    () => AuthDepsNode(
      navigationDepsNode(),
      authScopeDepsNode(),
      firebaseIntegrationDepsNode().googleSignIn(),
      appSettingsDepsNode().appSettingsStateHolder(),
    ),
  );

  late final firebaseIntegrationDepsNode =
      bind(() => FirebaseIntegrationDepsNode());

  late final locationDepsNode = bind(() => LocationDepsNode());

  late final internetConnectionDepsNode = bind(
    () => InternetConnectionCheckerDepsNode(),
  );

  late final sharedPrefsManager = bind(
    () => SharedPrefsManager(),
  );
}
