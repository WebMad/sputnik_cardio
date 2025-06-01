// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthSettings _$AuthSettingsFromJson(Map<String, dynamic> json) {
  return _AuthSettings.fromJson(json);
}

/// @nodoc
mixin _$AuthSettings {
  String get privacyPolicy => throw _privateConstructorUsedError;
  String get personalData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthSettingsCopyWith<AuthSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthSettingsCopyWith<$Res> {
  factory $AuthSettingsCopyWith(
          AuthSettings value, $Res Function(AuthSettings) then) =
      _$AuthSettingsCopyWithImpl<$Res, AuthSettings>;
  @useResult
  $Res call({String privacyPolicy, String personalData});
}

/// @nodoc
class _$AuthSettingsCopyWithImpl<$Res, $Val extends AuthSettings>
    implements $AuthSettingsCopyWith<$Res> {
  _$AuthSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? privacyPolicy = null,
    Object? personalData = null,
  }) {
    return _then(_value.copyWith(
      privacyPolicy: null == privacyPolicy
          ? _value.privacyPolicy
          : privacyPolicy // ignore: cast_nullable_to_non_nullable
              as String,
      personalData: null == personalData
          ? _value.personalData
          : personalData // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthSettingsImplCopyWith<$Res>
    implements $AuthSettingsCopyWith<$Res> {
  factory _$$AuthSettingsImplCopyWith(
          _$AuthSettingsImpl value, $Res Function(_$AuthSettingsImpl) then) =
      __$$AuthSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String privacyPolicy, String personalData});
}

/// @nodoc
class __$$AuthSettingsImplCopyWithImpl<$Res>
    extends _$AuthSettingsCopyWithImpl<$Res, _$AuthSettingsImpl>
    implements _$$AuthSettingsImplCopyWith<$Res> {
  __$$AuthSettingsImplCopyWithImpl(
      _$AuthSettingsImpl _value, $Res Function(_$AuthSettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? privacyPolicy = null,
    Object? personalData = null,
  }) {
    return _then(_$AuthSettingsImpl(
      privacyPolicy: null == privacyPolicy
          ? _value.privacyPolicy
          : privacyPolicy // ignore: cast_nullable_to_non_nullable
              as String,
      personalData: null == personalData
          ? _value.personalData
          : personalData // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthSettingsImpl with DiagnosticableTreeMixin implements _AuthSettings {
  const _$AuthSettingsImpl(
      {required this.privacyPolicy, required this.personalData});

  factory _$AuthSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthSettingsImplFromJson(json);

  @override
  final String privacyPolicy;
  @override
  final String personalData;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthSettings(privacyPolicy: $privacyPolicy, personalData: $personalData)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthSettings'))
      ..add(DiagnosticsProperty('privacyPolicy', privacyPolicy))
      ..add(DiagnosticsProperty('personalData', personalData));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSettingsImpl &&
            (identical(other.privacyPolicy, privacyPolicy) ||
                other.privacyPolicy == privacyPolicy) &&
            (identical(other.personalData, personalData) ||
                other.personalData == personalData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, privacyPolicy, personalData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSettingsImplCopyWith<_$AuthSettingsImpl> get copyWith =>
      __$$AuthSettingsImplCopyWithImpl<_$AuthSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthSettingsImplToJson(
      this,
    );
  }
}

abstract class _AuthSettings implements AuthSettings {
  const factory _AuthSettings(
      {required final String privacyPolicy,
      required final String personalData}) = _$AuthSettingsImpl;

  factory _AuthSettings.fromJson(Map<String, dynamic> json) =
      _$AuthSettingsImpl.fromJson;

  @override
  String get privacyPolicy;
  @override
  String get personalData;
  @override
  @JsonKey(ignore: true)
  _$$AuthSettingsImplCopyWith<_$AuthSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
