// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_segment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkoutSegment _$WorkoutSegmentFromJson(Map<String, dynamic> json) {
  return _WorkoutSegment.fromJson(json);
}

/// @nodoc
mixin _$WorkoutSegment {
  @JsonKey(name: 'uuid')
  String get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  WorkoutSegmentType get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_at')
  DateTime get startAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'route_uuid')
  String get routeUuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_at')
  DateTime? get endAt => throw _privateConstructorUsedError;

  /// Serializes this WorkoutSegment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutSegment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutSegmentCopyWith<WorkoutSegment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutSegmentCopyWith<$Res> {
  factory $WorkoutSegmentCopyWith(
          WorkoutSegment value, $Res Function(WorkoutSegment) then) =
      _$WorkoutSegmentCopyWithImpl<$Res, WorkoutSegment>;
  @useResult
  $Res call(
      {@JsonKey(name: 'uuid') String uuid,
      @JsonKey(name: 'type') WorkoutSegmentType type,
      @JsonKey(name: 'start_at') DateTime startAt,
      @JsonKey(name: 'route_uuid') String routeUuid,
      @JsonKey(name: 'end_at') DateTime? endAt});
}

/// @nodoc
class _$WorkoutSegmentCopyWithImpl<$Res, $Val extends WorkoutSegment>
    implements $WorkoutSegmentCopyWith<$Res> {
  _$WorkoutSegmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutSegment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? type = null,
    Object? startAt = null,
    Object? routeUuid = null,
    Object? endAt = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WorkoutSegmentType,
      startAt: null == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      routeUuid: null == routeUuid
          ? _value.routeUuid
          : routeUuid // ignore: cast_nullable_to_non_nullable
              as String,
      endAt: freezed == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutSegmentImplCopyWith<$Res>
    implements $WorkoutSegmentCopyWith<$Res> {
  factory _$$WorkoutSegmentImplCopyWith(_$WorkoutSegmentImpl value,
          $Res Function(_$WorkoutSegmentImpl) then) =
      __$$WorkoutSegmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'uuid') String uuid,
      @JsonKey(name: 'type') WorkoutSegmentType type,
      @JsonKey(name: 'start_at') DateTime startAt,
      @JsonKey(name: 'route_uuid') String routeUuid,
      @JsonKey(name: 'end_at') DateTime? endAt});
}

/// @nodoc
class __$$WorkoutSegmentImplCopyWithImpl<$Res>
    extends _$WorkoutSegmentCopyWithImpl<$Res, _$WorkoutSegmentImpl>
    implements _$$WorkoutSegmentImplCopyWith<$Res> {
  __$$WorkoutSegmentImplCopyWithImpl(
      _$WorkoutSegmentImpl _value, $Res Function(_$WorkoutSegmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkoutSegment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? type = null,
    Object? startAt = null,
    Object? routeUuid = null,
    Object? endAt = freezed,
  }) {
    return _then(_$WorkoutSegmentImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WorkoutSegmentType,
      startAt: null == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      routeUuid: null == routeUuid
          ? _value.routeUuid
          : routeUuid // ignore: cast_nullable_to_non_nullable
              as String,
      endAt: freezed == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutSegmentImpl implements _WorkoutSegment {
  const _$WorkoutSegmentImpl(
      {@JsonKey(name: 'uuid') required this.uuid,
      @JsonKey(name: 'type') required this.type,
      @JsonKey(name: 'start_at') required this.startAt,
      @JsonKey(name: 'route_uuid') required this.routeUuid,
      @JsonKey(name: 'end_at') this.endAt});

  factory _$WorkoutSegmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutSegmentImplFromJson(json);

  @override
  @JsonKey(name: 'uuid')
  final String uuid;
  @override
  @JsonKey(name: 'type')
  final WorkoutSegmentType type;
  @override
  @JsonKey(name: 'start_at')
  final DateTime startAt;
  @override
  @JsonKey(name: 'route_uuid')
  final String routeUuid;
  @override
  @JsonKey(name: 'end_at')
  final DateTime? endAt;

  @override
  String toString() {
    return 'WorkoutSegment(uuid: $uuid, type: $type, startAt: $startAt, routeUuid: $routeUuid, endAt: $endAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutSegmentImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.startAt, startAt) || other.startAt == startAt) &&
            (identical(other.routeUuid, routeUuid) ||
                other.routeUuid == routeUuid) &&
            (identical(other.endAt, endAt) || other.endAt == endAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uuid, type, startAt, routeUuid, endAt);

  /// Create a copy of WorkoutSegment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutSegmentImplCopyWith<_$WorkoutSegmentImpl> get copyWith =>
      __$$WorkoutSegmentImplCopyWithImpl<_$WorkoutSegmentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutSegmentImplToJson(
      this,
    );
  }
}

abstract class _WorkoutSegment implements WorkoutSegment {
  const factory _WorkoutSegment(
      {@JsonKey(name: 'uuid') required final String uuid,
      @JsonKey(name: 'type') required final WorkoutSegmentType type,
      @JsonKey(name: 'start_at') required final DateTime startAt,
      @JsonKey(name: 'route_uuid') required final String routeUuid,
      @JsonKey(name: 'end_at') final DateTime? endAt}) = _$WorkoutSegmentImpl;

  factory _WorkoutSegment.fromJson(Map<String, dynamic> json) =
      _$WorkoutSegmentImpl.fromJson;

  @override
  @JsonKey(name: 'uuid')
  String get uuid;
  @override
  @JsonKey(name: 'type')
  WorkoutSegmentType get type;
  @override
  @JsonKey(name: 'start_at')
  DateTime get startAt;
  @override
  @JsonKey(name: 'route_uuid')
  String get routeUuid;
  @override
  @JsonKey(name: 'end_at')
  DateTime? get endAt;

  /// Create a copy of WorkoutSegment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutSegmentImplCopyWith<_$WorkoutSegmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
