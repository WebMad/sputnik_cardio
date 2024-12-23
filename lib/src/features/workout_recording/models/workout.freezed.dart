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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Workout _$WorkoutFromJson(Map<String, dynamic> json) {
  return _Workout.fromJson(json);
}

/// @nodoc
mixin _$Workout {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_pos')
  ExtendedPos get startPos => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  WorkoutState get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_pos')
  ExtendedPos? get endPos => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_at')
  DateTime? get startAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'stop_at')
  DateTime? get stopAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkoutCopyWith<Workout> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutCopyWith<$Res> {
  factory $WorkoutCopyWith(Workout value, $Res Function(Workout) then) =
      _$WorkoutCopyWithImpl<$Res, Workout>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'start_pos') ExtendedPos startPos,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'status') WorkoutState status,
      @JsonKey(name: 'end_pos') ExtendedPos? endPos,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'start_at') DateTime? startAt,
      @JsonKey(name: 'stop_at') DateTime? stopAt});

  $ExtendedPosCopyWith<$Res> get startPos;
  $ExtendedPosCopyWith<$Res>? get endPos;
}

/// @nodoc
class _$WorkoutCopyWithImpl<$Res, $Val extends Workout>
    implements $WorkoutCopyWith<$Res> {
  _$WorkoutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startPos = null,
    Object? userId = null,
    Object? status = null,
    Object? endPos = freezed,
    Object? createdAt = null,
    Object? startAt = freezed,
    Object? stopAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      startPos: null == startPos
          ? _value.startPos
          : startPos // ignore: cast_nullable_to_non_nullable
              as ExtendedPos,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WorkoutState,
      endPos: freezed == endPos
          ? _value.endPos
          : endPos // ignore: cast_nullable_to_non_nullable
              as ExtendedPos?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startAt: freezed == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      stopAt: freezed == stopAt
          ? _value.stopAt
          : stopAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ExtendedPosCopyWith<$Res> get startPos {
    return $ExtendedPosCopyWith<$Res>(_value.startPos, (value) {
      return _then(_value.copyWith(startPos: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ExtendedPosCopyWith<$Res>? get endPos {
    if (_value.endPos == null) {
      return null;
    }

    return $ExtendedPosCopyWith<$Res>(_value.endPos!, (value) {
      return _then(_value.copyWith(endPos: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WorkoutImplCopyWith<$Res> implements $WorkoutCopyWith<$Res> {
  factory _$$WorkoutImplCopyWith(
          _$WorkoutImpl value, $Res Function(_$WorkoutImpl) then) =
      __$$WorkoutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'start_pos') ExtendedPos startPos,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'status') WorkoutState status,
      @JsonKey(name: 'end_pos') ExtendedPos? endPos,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'start_at') DateTime? startAt,
      @JsonKey(name: 'stop_at') DateTime? stopAt});

  @override
  $ExtendedPosCopyWith<$Res> get startPos;
  @override
  $ExtendedPosCopyWith<$Res>? get endPos;
}

/// @nodoc
class __$$WorkoutImplCopyWithImpl<$Res>
    extends _$WorkoutCopyWithImpl<$Res, _$WorkoutImpl>
    implements _$$WorkoutImplCopyWith<$Res> {
  __$$WorkoutImplCopyWithImpl(
      _$WorkoutImpl _value, $Res Function(_$WorkoutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startPos = null,
    Object? userId = null,
    Object? status = null,
    Object? endPos = freezed,
    Object? createdAt = null,
    Object? startAt = freezed,
    Object? stopAt = freezed,
  }) {
    return _then(_$WorkoutImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      startPos: null == startPos
          ? _value.startPos
          : startPos // ignore: cast_nullable_to_non_nullable
              as ExtendedPos,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WorkoutState,
      endPos: freezed == endPos
          ? _value.endPos
          : endPos // ignore: cast_nullable_to_non_nullable
              as ExtendedPos?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startAt: freezed == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      stopAt: freezed == stopAt
          ? _value.stopAt
          : stopAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutImpl with DiagnosticableTreeMixin implements _Workout {
  const _$WorkoutImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'start_pos') required this.startPos,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'end_pos') this.endPos,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'start_at') this.startAt,
      @JsonKey(name: 'stop_at') this.stopAt});

  factory _$WorkoutImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'start_pos')
  final ExtendedPos startPos;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'status')
  final WorkoutState status;
  @override
  @JsonKey(name: 'end_pos')
  final ExtendedPos? endPos;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'start_at')
  final DateTime? startAt;
  @override
  @JsonKey(name: 'stop_at')
  final DateTime? stopAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Workout(id: $id, startPos: $startPos, userId: $userId, status: $status, endPos: $endPos, createdAt: $createdAt, startAt: $startAt, stopAt: $stopAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Workout'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('startPos', startPos))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('endPos', endPos))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('startAt', startAt))
      ..add(DiagnosticsProperty('stopAt', stopAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startPos, startPos) ||
                other.startPos == startPos) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.endPos, endPos) || other.endPos == endPos) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.startAt, startAt) || other.startAt == startAt) &&
            (identical(other.stopAt, stopAt) || other.stopAt == stopAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, startPos, userId, status,
      endPos, createdAt, startAt, stopAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutImplCopyWith<_$WorkoutImpl> get copyWith =>
      __$$WorkoutImplCopyWithImpl<_$WorkoutImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutImplToJson(
      this,
    );
  }
}

abstract class _Workout implements Workout {
  const factory _Workout(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'start_pos') required final ExtendedPos startPos,
      @JsonKey(name: 'user_id') required final String userId,
      @JsonKey(name: 'status') required final WorkoutState status,
      @JsonKey(name: 'end_pos') final ExtendedPos? endPos,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'start_at') final DateTime? startAt,
      @JsonKey(name: 'stop_at') final DateTime? stopAt}) = _$WorkoutImpl;

  factory _Workout.fromJson(Map<String, dynamic> json) = _$WorkoutImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'start_pos')
  ExtendedPos get startPos;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'status')
  WorkoutState get status;
  @override
  @JsonKey(name: 'end_pos')
  ExtendedPos? get endPos;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'start_at')
  DateTime? get startAt;
  @override
  @JsonKey(name: 'stop_at')
  DateTime? get stopAt;
  @override
  @JsonKey(ignore: true)
  _$$WorkoutImplCopyWith<_$WorkoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
