// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pending_workout.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PendingWorkout _$PendingWorkoutFromJson(Map<String, dynamic> json) {
  return _PendingWorkout.fromJson(json);
}

/// @nodoc
mixin _$PendingWorkout {
  Workout get workout => throw _privateConstructorUsedError;
  List<WorkoutRoute> get routes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PendingWorkoutCopyWith<PendingWorkout> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingWorkoutCopyWith<$Res> {
  factory $PendingWorkoutCopyWith(
          PendingWorkout value, $Res Function(PendingWorkout) then) =
      _$PendingWorkoutCopyWithImpl<$Res, PendingWorkout>;
  @useResult
  $Res call({Workout workout, List<WorkoutRoute> routes});

  $WorkoutCopyWith<$Res> get workout;
}

/// @nodoc
class _$PendingWorkoutCopyWithImpl<$Res, $Val extends PendingWorkout>
    implements $PendingWorkoutCopyWith<$Res> {
  _$PendingWorkoutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workout = null,
    Object? routes = null,
  }) {
    return _then(_value.copyWith(
      workout: null == workout
          ? _value.workout
          : workout // ignore: cast_nullable_to_non_nullable
              as Workout,
      routes: null == routes
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<WorkoutRoute>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WorkoutCopyWith<$Res> get workout {
    return $WorkoutCopyWith<$Res>(_value.workout, (value) {
      return _then(_value.copyWith(workout: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PendingWorkoutImplCopyWith<$Res>
    implements $PendingWorkoutCopyWith<$Res> {
  factory _$$PendingWorkoutImplCopyWith(_$PendingWorkoutImpl value,
          $Res Function(_$PendingWorkoutImpl) then) =
      __$$PendingWorkoutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Workout workout, List<WorkoutRoute> routes});

  @override
  $WorkoutCopyWith<$Res> get workout;
}

/// @nodoc
class __$$PendingWorkoutImplCopyWithImpl<$Res>
    extends _$PendingWorkoutCopyWithImpl<$Res, _$PendingWorkoutImpl>
    implements _$$PendingWorkoutImplCopyWith<$Res> {
  __$$PendingWorkoutImplCopyWithImpl(
      _$PendingWorkoutImpl _value, $Res Function(_$PendingWorkoutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workout = null,
    Object? routes = null,
  }) {
    return _then(_$PendingWorkoutImpl(
      workout: null == workout
          ? _value.workout
          : workout // ignore: cast_nullable_to_non_nullable
              as Workout,
      routes: null == routes
          ? _value._routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<WorkoutRoute>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PendingWorkoutImpl implements _PendingWorkout {
  const _$PendingWorkoutImpl(
      {required this.workout, required final List<WorkoutRoute> routes})
      : _routes = routes;

  factory _$PendingWorkoutImpl.fromJson(Map<String, dynamic> json) =>
      _$$PendingWorkoutImplFromJson(json);

  @override
  final Workout workout;
  final List<WorkoutRoute> _routes;
  @override
  List<WorkoutRoute> get routes {
    if (_routes is EqualUnmodifiableListView) return _routes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_routes);
  }

  @override
  String toString() {
    return 'PendingWorkout(workout: $workout, routes: $routes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PendingWorkoutImpl &&
            (identical(other.workout, workout) || other.workout == workout) &&
            const DeepCollectionEquality().equals(other._routes, _routes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, workout, const DeepCollectionEquality().hash(_routes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PendingWorkoutImplCopyWith<_$PendingWorkoutImpl> get copyWith =>
      __$$PendingWorkoutImplCopyWithImpl<_$PendingWorkoutImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PendingWorkoutImplToJson(
      this,
    );
  }
}

abstract class _PendingWorkout implements PendingWorkout {
  const factory _PendingWorkout(
      {required final Workout workout,
      required final List<WorkoutRoute> routes}) = _$PendingWorkoutImpl;

  factory _PendingWorkout.fromJson(Map<String, dynamic> json) =
      _$PendingWorkoutImpl.fromJson;

  @override
  Workout get workout;
  @override
  List<WorkoutRoute> get routes;
  @override
  @JsonKey(ignore: true)
  _$$PendingWorkoutImplCopyWith<_$PendingWorkoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
