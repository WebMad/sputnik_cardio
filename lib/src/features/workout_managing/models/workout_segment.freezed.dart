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

/// @nodoc
mixin _$WorkoutSegment {
  WorkoutSegmentType get type => throw _privateConstructorUsedError;
  DateTime get startAt => throw _privateConstructorUsedError;
  String get routeUuid => throw _privateConstructorUsedError;
  DateTime? get endAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
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
      {WorkoutSegmentType type,
      DateTime startAt,
      String routeUuid,
      DateTime? endAt});
}

/// @nodoc
class _$WorkoutSegmentCopyWithImpl<$Res, $Val extends WorkoutSegment>
    implements $WorkoutSegmentCopyWith<$Res> {
  _$WorkoutSegmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? startAt = null,
    Object? routeUuid = null,
    Object? endAt = freezed,
  }) {
    return _then(_value.copyWith(
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
      {WorkoutSegmentType type,
      DateTime startAt,
      String routeUuid,
      DateTime? endAt});
}

/// @nodoc
class __$$WorkoutSegmentImplCopyWithImpl<$Res>
    extends _$WorkoutSegmentCopyWithImpl<$Res, _$WorkoutSegmentImpl>
    implements _$$WorkoutSegmentImplCopyWith<$Res> {
  __$$WorkoutSegmentImplCopyWithImpl(
      _$WorkoutSegmentImpl _value, $Res Function(_$WorkoutSegmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? startAt = null,
    Object? routeUuid = null,
    Object? endAt = freezed,
  }) {
    return _then(_$WorkoutSegmentImpl(
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

class _$WorkoutSegmentImpl implements _WorkoutSegment {
  const _$WorkoutSegmentImpl(
      {required this.type,
      required this.startAt,
      required this.routeUuid,
      this.endAt});

  @override
  final WorkoutSegmentType type;
  @override
  final DateTime startAt;
  @override
  final String routeUuid;
  @override
  final DateTime? endAt;

  @override
  String toString() {
    return 'WorkoutSegment(type: $type, startAt: $startAt, routeUuid: $routeUuid, endAt: $endAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutSegmentImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.startAt, startAt) || other.startAt == startAt) &&
            (identical(other.routeUuid, routeUuid) ||
                other.routeUuid == routeUuid) &&
            (identical(other.endAt, endAt) || other.endAt == endAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, startAt, routeUuid, endAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutSegmentImplCopyWith<_$WorkoutSegmentImpl> get copyWith =>
      __$$WorkoutSegmentImplCopyWithImpl<_$WorkoutSegmentImpl>(
          this, _$identity);
}

abstract class _WorkoutSegment implements WorkoutSegment {
  const factory _WorkoutSegment(
      {required final WorkoutSegmentType type,
      required final DateTime startAt,
      required final String routeUuid,
      final DateTime? endAt}) = _$WorkoutSegmentImpl;

  @override
  WorkoutSegmentType get type;
  @override
  DateTime get startAt;
  @override
  String get routeUuid;
  @override
  DateTime? get endAt;
  @override
  @JsonKey(ignore: true)
  _$$WorkoutSegmentImplCopyWith<_$WorkoutSegmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
