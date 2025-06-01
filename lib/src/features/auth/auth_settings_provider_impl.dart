import 'package:sputnik_auth/sputnik_auth.dart';
import 'package:sputnik_cardio/src/features/app_settings/models/app_setting.dart';
import 'package:sputnik_cardio/src/features/app_settings/state_holders/app_settings_state_holder.dart';

class AuthSettingsProviderImpl implements AuthSettingsProvider {
  final AppSettingsStateHolder _appSettingsStateHolder;

  AuthSettingsProviderImpl(this._appSettingsStateHolder);

  @override
  AuthSettings get authSettings => AuthSettings(
        privacyPolicy:
            _appSettingsStateHolder.state[AppSetting.privacyPolicy]?.value ??
                "",
        personalData:
            _appSettingsStateHolder.state[AppSetting.personalData]?.value ?? "",
      );

  @override
  Stream<AuthSettings> get authSettingsStream =>
      _appSettingsStateHolder.stream.map((_) => authSettings);
}
