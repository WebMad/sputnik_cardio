import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/app_settings/data_sources/app_settings_remote_data_source.dart';
import 'package:sputnik_cardio/src/features/app_settings/repository/app_settings_repository.dart';
import 'package:sputnik_cardio/src/features/app_settings/state_holders/app_settings_state_holder.dart';

class AppSettingsManager implements Lifecycle {
  final AppSettingsRepository _appSettingsRepository;
  final AppSettingsStateHolder _appSettingsStateHolder;

  AppSettingsManager(
    this._appSettingsRepository,
    this._appSettingsStateHolder,
  );

  @override
  Future<void> init() async {
    _init();
  }

  Future<void> _init() async {
    final settings = await _appSettingsRepository.load();

    _appSettingsStateHolder.update(
      Map.fromEntries(
        settings.map(
          (e) => MapEntry(e.code, e),
        ),
      ),
    );
  }

  @override
  Future<void> dispose() async {}
}
