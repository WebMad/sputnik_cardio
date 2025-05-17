import 'package:sputnik_cardio/src/features/app_settings/data_sources/app_settings_local_data_source.dart';
import 'package:sputnik_cardio/src/features/app_settings/data_sources/app_settings_remote_data_source.dart';
import 'package:sputnik_cardio/src/features/app_settings/models/app_setting.dart';
import 'package:sputnik_cardio/src/features/internet_connection_checker/state_holder/internet_connection_state_holder.dart';

class AppSettingsRepository {
  final AppSettingsLocalDataSource _appSettingsLocalDataSource;
  final AppSettingsRemoteDataSource _appSettingsRemoteDataSource;
  final InternetConnectionStateHolder _internetConnectionStateHolder;

  AppSettingsRepository(
    this._appSettingsLocalDataSource,
    this._appSettingsRemoteDataSource,
    this._internetConnectionStateHolder,
  );

  Future<List<AppSetting>> load() async {
    if (!_internetConnectionStateHolder.hasInternet) {
      return await _appSettingsLocalDataSource.load();
    }

    try {
      return await _appSettingsRemoteDataSource.getSettings();
    } on Object catch (e, st) {
      print(e);
      print(st);

      return await _appSettingsLocalDataSource.load();
    }
  }
}
