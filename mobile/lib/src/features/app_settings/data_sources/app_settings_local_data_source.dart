import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sputnik_cardio/src/features/app_settings/models/app_setting.dart';

class AppSettingsLocalDataSource {
  static const _settingsStorageKey = 'app_settings';
  final SharedPreferences _sharedPreferences;

  AppSettingsLocalDataSource(this._sharedPreferences);

  Future<void> save(List<AppSetting> settings) async {
    await _sharedPreferences.setString(
      _settingsStorageKey,
      jsonEncode(
        settings.map(
          (e) => e.toJson(),
        ),
      ),
    );
  }

  Future<List<AppSetting>> load() async {
    final rawSettings = await _sharedPreferences.getString(_settingsStorageKey);

    if (rawSettings == null) {
      return [];
    }

    return (jsonDecode(rawSettings) as List<dynamic>)
        .map(
          (e) => AppSetting.fromJson(e as Map<String, dynamic>),
        )
        .toList();
  }
}
