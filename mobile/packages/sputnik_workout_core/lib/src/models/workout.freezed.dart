// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Workout _$WorkoutFromJson(Map<String, dynamic> json) {
  return _Workout.fromJson(json);
}

/// @nodoc
mixin _$Workout {
  @JsonKey(name: 'uuid')
  String get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_at')
  DateTime get startAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'stop_at')
  DateTime? get stopAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'state')
  WorkoutState get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'segments')
  List<WorkoutSegment> get segments => throw _privateConstructorUsedError;

  /// Serializes this Workout to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Workout
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutCopyWith<Workout> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutCopyWith<$Res> {
  factory $WorkoutCopyWith(Workout value, $Res Function(Workout) then) =
      _$WorkoutCopyWithImpl<$Res, Workout>;
  @useResult
  $Res call({
    @JsonKey(name: 'uuid') String uuid,
    @JsonKey(name: 'start_at') DateTime startAt,
    @JsonKey(name: 'stop_at') DateTime? stopAt,
    @JsonKey(name: 'state') WorkoutState state,
    @JsonKey(name: 'segments') List<WorkoutSegment> segments,
  });
}

/// @nodoc
class _$WorkoutCopyWithImpl<$Res, $Val extends Workout>
    implements $WorkoutCopyWith<$Res> {
  _$WorkoutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Workout
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? startAt = null,
    Object? stopAt = freezed,
    Object? state = null,
    Object? segments = null,
  }) {
    return _then(
      _value.copyWith(
            uuid:
                null == uuid
                    ? _value.uuid
                    : uuid // ignore: cast_nullable_to_non_nullable
                        as String,
            startAt:
                null == startAt
                    ? _value.startAt
                    : startAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            stopAt:
                freezed == stopAt
                    ? _value.stopAt
                    : stopAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            state:
                null == state
                    ? _value.state
                    : state // ignore: cast_nullable_to_non_nullable
                        as WorkoutState,
            segments:
                null == segments
                    ? _value.segments
                    : segments // ignore: cast_nullable_to_non_nullable
                        as List<WorkoutSegment>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkoutImplCopyWith<$Res> implements $WorkoutCopyWith<$Res> {
  factory _$$WorkoutImplCopyWith(
    _$WorkoutImpl value,
    $Res Function(_$WorkoutImpl) then,
  ) = __$$WorkoutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'uuid') String uuid,
    @JsonKey(name: 'start_at') DateTime startAt,
    @JsonKey(name: 'stop_at') DateTime? stopAt,
    @JsonKey(name: 'state') WorkoutState state,
    @JsonKey(name: 'segments') List<WorkoutSegment> segments,
  });
}

/// @nodoc
class __$$WorkoutImplCopyWithImpl<$Res>
    extends _$WorkoutCopyWithImpl<$Res, _$WorkoutImpl>
    implements _$$WorkoutImplCopyWith<$Res> {
  __$$WorkoutImplCopyWithImpl(
    _$WorkoutImpl _value,
    $Res Function(_$WorkoutImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Workout
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? startAt = null,
    Object? stopAt = freezed,
    Object? state = null,
    Object? segments = null,
  }) {
    return _then(
      _$WorkoutImpl(
        uuid:
            null == uuid
                ? _value.uuid
                : uuid // ignore: cast_nullable_to_non_nullable
                    as String,
        startAt:
            null == startAt
                ? _value.startAt
                : startAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        stopAt:
            freezed == stopAt
                ? _value.stopAt
                : stopAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        state:
            null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                    as WorkoutState,
        segments:
            null == segments
                ? _value._segments
                : segments // ignore: cast_nullable_to_non_nullable
                    as List<WorkoutSegment>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutImpl implements _Workout {
  const _$WorkoutImpl({
    @JsonKey(name: 'uuid') required this.uuid,
    @JsonKey(name: 'start_at') required this.startAt,
    @JsonKey(name: 'stop_at') this.stopAt,
    @JsonKey(name: 'state') required this.state,
    @JsonKey(name: 'segments') final List<WorkoutSegment> segments = const [],
  }) : _segments = segments;

  factory _$WorkoutImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutImplFromJson(json);

  @override
  @JsonKey(name: 'uuid')
  final String uuid;
  @override
  @JsonKey(name: 'start_at')
  final DateTime startAt;
  @override
  @JsonKey(name: 'stop_at')
  final DateTime? stopAt;
  @override
  @JsonKey(name: 'state')
  final WorkoutState state;
  final List<WorkoutSegment> _segments;
  @override
  @JsonKey(name: 'segments')
  List<WorkoutSegment> get segments {
    if (_segments is EqualUnmodifiableListView) return _segments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_segments);
  }

  @override
  String toString() {
    return 'Workout(uuid: $uuid, startAt: $startAt, stopAt: $stopAt, state: $state, segments: $segments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.startAt, startAt) || other.startAt == startAt) &&
            (identical(other.stopAt, stopAt) || other.stopAt == stopAt) &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality().equals(other._segments, _segments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    uuid,
    startAt,
    stopAt,
    state,
    const DeepCollectionEquality().hash(_segments),
  );

  /// Create a copy of Workout
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutImplCopyWith<_$WorkoutImpl> get copyWith =>
      __$$WorkoutImplCopyWithImpl<_$WorkoutImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutImplToJson(this);
  }
}

abstract class _Workout implements Workout {
  const factory _Workout({
    @JsonKey(name: 'uuid') required final String uuid,
    @JsonKey(name: 'start_at') required final DateTime startAt,
    @JsonKey(name: 'stop_at') final DateTime? stopAt,
    @JsonKey(name: 'state') required final WorkoutState state,
    @JsonKey(name: 'segments') final List<WorkoutSegment> segments,
  }) = _$WorkoutImpl;

  factory _Workout.fromJson(Map<String, dynamic> json) = _$WorkoutImpl.fromJson;

  @override
  @JsonKey(name: 'uuid')
  String get uuid;
  @override
  @JsonKey(name: 'start_at')
  DateTime get startAt;
  @override
  @JsonKey(name: 'stop_at')
  DateTime? get stopAt;
  @override
  @JsonKey(name: 'state')
  WorkoutState get state;
  @override
  @JsonKey(name: 'segments')
  List<WorkoutSegment> get segments;

  /// Create a copy of Workout
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutImplCopyWith<_$WorkoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
