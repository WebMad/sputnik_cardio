import 'package:sputnik_auth/src/models/auth_settings.dart';

abstract class AuthSettingsProvider {
  Stream<AuthSettings> get authSettingsStream;

  AuthSettings get authSettings;
}
