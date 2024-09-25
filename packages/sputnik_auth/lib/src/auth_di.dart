import 'package:sputnik_auth/src/auth_data_source/auth_data_source_di.dart';
import 'package:sputnik_auth/src/auth_manager.dart';
import 'package:sputnik_auth/src/auth_state_holder.dart';
import 'package:sputnik_di/sputnik_di.dart';

class AuthDi extends DepsNode {
  final AuthDataSourceDi _authDataSourceDi;

  late final authStateHolder = bind(() => AuthStateHolder());

  late final authManager = bind(
    () => AuthManager(
      authStateHolder,
      _authDataSourceDi.authDataSource,
    ),
  );

  AuthDi(this._authDataSourceDi);
}
