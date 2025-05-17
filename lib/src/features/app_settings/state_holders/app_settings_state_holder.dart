import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/app_settings/models/app_setting.dart';

class AppSettingsStateHolder extends StateHolder<Map<String, AppSetting>> {
  AppSettingsStateHolder() : super({});

  void update(Map<String, AppSetting> settings) {
    state = settings;
  }
}
