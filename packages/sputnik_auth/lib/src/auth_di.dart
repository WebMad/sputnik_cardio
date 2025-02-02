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

  late final authStateHolderDep = bind(() => AuthStateHolder());

  late final signUpStateHolderDep = bind(() => SignUpStateHolder());

  late final signUpManager = bind(
    () => SignUpManager(
      _supabaseClient,
      authManagerDep(),
      signUpStateHolderDep(),
      signInManagerDep(),
    ),
  );

  late final signInManagerDep = bind(
    () => SignInManager(
      _supabaseClient,
      authManagerDep(),
      signInStateHolderDep(),
    ),
  );

  late final signInStateHolderDep = bind(
    () => SignInStateHolder(),
  );

  late final authManagerDep = bind(
    () => AuthManager(
      authStateHolderDep(),
      _supabaseClient,
    ),
  );

  @override
  List<Set<Lifecycle Function()>> get initializeQueue => [
        {
          authManagerDep,
        },
      ];
}
