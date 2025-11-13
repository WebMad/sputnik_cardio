import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sputnik_cardio/src/features/app_settings/data_sources/app_settings_local_data_source.dart';
import 'package:sputnik_cardio/src/features/app_settings/data_sources/app_settings_remote_data_source.dart';
import 'package:sputnik_cardio/src/features/app_settings/managers/app_settings_manager.dart';
import 'package:sputnik_cardio/src/features/app_settings/repository/app_settings_repository.dart';
import 'package:sputnik_cardio/src/features/app_settings/state_holders/app_settings_state_holder.dart';
import 'package:sputnik_cardio/src/features/internet_connection_checker/state_holder/internet_connection_state_holder.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppSettingsDepsNode extends DepsNode {
  final InternetConnectionStateHolder _internetConnectionStateHolder;
  final SharedPreferences _sharedPreferences;
  final SupabaseClient _supabaseClient;

  late final appSettingsManager = bind(
    () => AppSettingsManager(
      _appSettingsRepository(),
      appSettingsStateHolder(),
    ),
  );

  late final _appSettingsRepository = bind(
    () => AppSettingsRepository(
      _appSettingsLocalDataSource(),
      _appSettingsRemoteDataSource(),
      _internetConnectionStateHolder,
    ),
  );

  late final appSettingsStateHolder = bind(
    () => AppSettingsStateHolder(),
  );

  late final _appSettingsLocalDataSource = bind(
    () => AppSettingsLocalDataSource(_sharedPreferences),
  );

  late final _appSettingsRemoteDataSource = bind(
    () => AppSettingsRemoteDataSource(_supabaseClient),
  );

  AppSettingsDepsNode(
    this._internetConnectionStateHolder,
    this._sharedPreferences,
    this._supabaseClient,
  );

  @override
  // TODO: implement initializeQueue
  List<Set<LifecycleDependency>> get initializeQueue => [
        {
          appSettingsStateHolder,
        },
        {
          appSettingsManager,
        },
      ];
}
