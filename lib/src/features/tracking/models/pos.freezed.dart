// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LatLonPos _$LatLonPosFromJson(Map<String, dynamic> json) {
  return _LatLonPos.fromJson(json);
}

/// @nodoc
mixin _$LatLonPos {
  double get lat => throw _privateConstructorUsedError;
  double get lon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LatLonPosCopyWith<LatLonPos> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LatLonPosCopyWith<$Res> {
  factory $LatLonPosCopyWith(LatLonPos value, $Res Function(LatLonPos) then) =
      _$LatLonPosCopyWithImpl<$Res, LatLonPos>;
  @useResult
  $Res call({double lat, double lon});
}

/// @nodoc
class _$LatLonPosCopyWithImpl<$Res, $Val extends LatLonPos>
    implements $LatLonPosCopyWith<$Res> {
  _$LatLonPosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lon = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LatLonPosImplCopyWith<$Res>
    implements $LatLonPosCopyWith<$Res> {
  factory _$$LatLonPosImplCopyWith(
          _$LatLonPosImpl value, $Res Function(_$LatLonPosImpl) then) =
      __$$LatLonPosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lon});
}

/// @nodoc
class __$$LatLonPosImplCopyWithImpl<$Res>
    extends _$LatLonPosCopyWithImpl<$Res, _$LatLonPosImpl>
    implements _$$LatLonPosImplCopyWith<$Res> {
  __$$LatLonPosImplCopyWithImpl(
      _$LatLonPosImpl _value, $Res Function(_$LatLonPosImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lon = null,
  }) {
    return _then(_$LatLonPosImpl(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LatLonPosImpl with DiagnosticableTreeMixin implements _LatLonPos {
  const _$LatLonPosImpl({required this.lat, required this.lon});

  factory _$LatLonPosImpl.fromJson(Map<String, dynamic> json) =>
      _$$LatLonPosImplFromJson(json);

  @override
  final double lat;
  @override
  final double lon;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LatLonPos(lat: $lat, lon: $lon)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LatLonPos'))
      ..add(DiagnosticsProperty('lat', lat))
      ..add(DiagnosticsProperty('lon', lon));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LatLonPosImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LatLonPosImplCopyWith<_$LatLonPosImpl> get copyWith =>
      __$$LatLonPosImplCopyWithImpl<_$LatLonPosImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LatLonPosImplToJson(
      this,
    );
  }
}

abstract class _LatLonPos implements LatLonPos {
  const factory _LatLonPos(
      {required final double lat, required final double lon}) = _$LatLonPosImpl;

  factory _LatLonPos.fromJson(Map<String, dynamic> json) =
      _$LatLonPosImpl.fromJson;

  @override
  double get lat;
  @override
  double get lon;
  @override
  @JsonKey(ignore: true)
  _$$LatLonPosImplCopyWith<_$LatLonPosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
