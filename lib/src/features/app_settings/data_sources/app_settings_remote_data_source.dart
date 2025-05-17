import 'package:sputnik_cardio/src/features/app_settings/models/app_setting.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppSettingsRemoteDataSource {
  final SupabaseClient _supabaseClient;

  AppSettingsRemoteDataSource(this._supabaseClient);

  Future<List<AppSetting>> getSettings() async {
    final rawAppSettings = await _supabaseClient.from('app_settings').select();

    return (rawAppSettings as List<dynamic>)
        .map(
          (rawAppSetting) =>
              AppSetting.fromJson(rawAppSetting as Map<String, dynamic>),
        )
        .toList();
  }
}
