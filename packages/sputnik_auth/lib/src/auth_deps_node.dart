import 'package:sputnik_auth/sputnik_auth.dart';
import 'package:sputnik_auth/src/auth_manager.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_auth/src/sign_in/sign_in_state_holder.dart';
import 'package:sputnik_auth/src/sign_up/sign_up_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'sign_in/sign_in_manager.dart';
import 'sign_up/sign_up_state_holder.dart';
import 'state_holders/auth_state_holder.dart';

class AuthDepsNode extends DepsNode {
  final SupabaseClient _supabaseClient;

  AuthDepsNode(this._supabaseClient);

  late final authStateHolder = bind(() => AuthStateHolder());

  late final signUpStateHolder = bind(() => SignUpStateHolder());

  late final signUpManager = bind(
    () => SignUpManager(
      _supabaseClient,
      authManager(),
      signUpStateHolder(),
      signInManager(),
    ),
  );

  late final signInManager = bind(
    () => SignInManager(
      _supabaseClient,
      authManager(),
      signInStateHolder(),
    ),
  );

  late final signInStateHolder = bind(
    () => SignInStateHolder(),
  );

  late final authManager = bind(
    () => AuthManager(
      authStateHolder(),
      _supabaseClient,
    ),
  );

  @override
  List<Set<LifecycleDependency>> get initializeQueue => [
        {
          signInStateHolder,
          signUpStateHolder,
          authStateHolder,
        },
        {
          authManager,
        },
      ];
}
