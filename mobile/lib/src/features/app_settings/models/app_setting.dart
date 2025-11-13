import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_setting.freezed.dart';

part 'app_setting.g.dart';

@freezed
class AppSetting with _$AppSetting {
  static const privacyPolicy = 'privacy_policy';
  static const personalData = 'personal_data';
  static const supportEmail = 'support_email';

  const factory AppSetting({
    required String uuid,
    required String code,
    required String value,
  }) = _AppSetting;

  factory AppSetting.fromJson(Map<String, dynamic> json) =>
      _$AppSettingFromJson(json);
}
