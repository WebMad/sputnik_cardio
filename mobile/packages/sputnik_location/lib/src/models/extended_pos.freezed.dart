// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'extended_pos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ExtendedPos _$ExtendedPosFromJson(Map<String, dynamic> json) {
  return _ExtendedPos.fromJson(json);
}

/// @nodoc
mixin _$ExtendedPos {
  double get lat => throw _privateConstructorUsedError;
  double get lon => throw _privateConstructorUsedError;
  double get alt => throw _privateConstructorUsedError;
  @JsonKey(name: 'fetched_at')
  DateTime get fetchedAt => throw _privateConstructorUsedError;

  /// Serializes this ExtendedPos to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExtendedPos
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExtendedPosCopyWith<ExtendedPos> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtendedPosCopyWith<$Res> {
  factory $ExtendedPosCopyWith(
    ExtendedPos value,
    $Res Function(ExtendedPos) then,
  ) = _$ExtendedPosCopyWithImpl<$Res, ExtendedPos>;
  @useResult
  $Res call({
    double lat,
    double lon,
    double alt,
    @JsonKey(name: 'fetched_at') DateTime fetchedAt,
  });
}

/// @nodoc
class _$ExtendedPosCopyWithImpl<$Res, $Val extends ExtendedPos>
    implements $ExtendedPosCopyWith<$Res> {
  _$ExtendedPosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExtendedPos
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lon = null,
    Object? alt = null,
    Object? fetchedAt = null,
  }) {
    return _then(
      _value.copyWith(
            lat:
                null == lat
                    ? _value.lat
                    : lat // ignore: cast_nullable_to_non_nullable
                        as double,
            lon:
                null == lon
                    ? _value.lon
                    : lon // ignore: cast_nullable_to_non_nullable
                        as double,
            alt:
                null == alt
                    ? _value.alt
                    : alt // ignore: cast_nullable_to_non_nullable
                        as double,
            fetchedAt:
                null == fetchedAt
                    ? _value.fetchedAt
                    : fetchedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExtendedPosImplCopyWith<$Res>
    implements $ExtendedPosCopyWith<$Res> {
  factory _$$ExtendedPosImplCopyWith(
    _$ExtendedPosImpl value,
    $Res Function(_$ExtendedPosImpl) then,
  ) = __$$ExtendedPosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double lat,
    double lon,
    double alt,
    @JsonKey(name: 'fetched_at') DateTime fetchedAt,
  });
}

/// @nodoc
class __$$ExtendedPosImplCopyWithImpl<$Res>
    extends _$ExtendedPosCopyWithImpl<$Res, _$ExtendedPosImpl>
    implements _$$ExtendedPosImplCopyWith<$Res> {
  __$$ExtendedPosImplCopyWithImpl(
    _$ExtendedPosImpl _value,
    $Res Function(_$ExtendedPosImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExtendedPos
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lon = null,
    Object? alt = null,
    Object? fetchedAt = null,
  }) {
    return _then(
      _$ExtendedPosImpl(
        lat:
            null == lat
                ? _value.lat
                : lat // ignore: cast_nullable_to_non_nullable
                    as double,
        lon:
            null == lon
                ? _value.lon
                : lon // ignore: cast_nullable_to_non_nullable
                    as double,
        alt:
            null == alt
                ? _value.alt
                : alt // ignore: cast_nullable_to_non_nullable
                    as double,
        fetchedAt:
            null == fetchedAt
                ? _value.fetchedAt
                : fetchedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExtendedPosImpl implements _ExtendedPos {
  const _$ExtendedPosImpl({
    required this.lat,
    required this.lon,
    required this.alt,
    @JsonKey(name: 'fetched_at') required this.fetchedAt,
  });

  factory _$ExtendedPosImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExtendedPosImplFromJson(json);

  @override
  final double lat;
  @override
  final double lon;
  @override
  final double alt;
  @override
  @JsonKey(name: 'fetched_at')
  final DateTime fetchedAt;

  @override
  String toString() {
    return 'ExtendedPos(lat: $lat, lon: $lon, alt: $alt, fetchedAt: $fetchedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtendedPosImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.alt, alt) || other.alt == alt) &&
            (identical(other.fetchedAt, fetchedAt) ||
                other.fetchedAt == fetchedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lon, alt, fetchedAt);

  /// Create a copy of ExtendedPos
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtendedPosImplCopyWith<_$ExtendedPosImpl> get copyWith =>
      __$$ExtendedPosImplCopyWithImpl<_$ExtendedPosImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExtendedPosImplToJson(this);
  }
}

abstract class _ExtendedPos implements ExtendedPos {
  const factory _ExtendedPos({
    required final double lat,
    required final double lon,
    required final double alt,
    @JsonKey(name: 'fetched_at') required final DateTime fetchedAt,
  }) = _$ExtendedPosImpl;

  factory _ExtendedPos.fromJson(Map<String, dynamic> json) =
      _$ExtendedPosImpl.fromJson;

  @override
  double get lat;
  @override
  double get lon;
  @override
  double get alt;
  @override
  @JsonKey(name: 'fetched_at')
  DateTime get fetchedAt;

  /// Create a copy of ExtendedPos
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExtendedPosImplCopyWith<_$ExtendedPosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
