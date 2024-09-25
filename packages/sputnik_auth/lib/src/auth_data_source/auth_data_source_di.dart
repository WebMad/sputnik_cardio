import 'package:sputnik_auth/src/auth_data_source/auth_data_source.dart';
import 'package:sputnik_di/sputnik_di.dart';

abstract class AuthDataSourceDi extends DepsNode {
  late final AuthDataSource authDataSource;
}

class SupabaseAuthDataSourceDi extends AuthDataSourceDi {
  @override
  late final authDataSource = SupabaseAuthDataSource();
}
