import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_settings.freezed.dart';
part 'auth_settings.g.dart';

@freezed
class AuthSettings with _$AuthSettings {
  const factory AuthSettings({
    required String privacyPolicy,
    required String personalData,
  }) = _AuthSettings;

  factory AuthSettings.fromJson(Map<String, dynamic> json) =>
      _$AuthSettingsFromJson(json);
}