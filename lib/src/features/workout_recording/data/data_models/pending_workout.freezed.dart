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
  WorkoutMetrics get workoutMetrics => throw _privateConstructorUsedError;

  /// Serializes this PendingWorkout to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PendingWorkout
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PendingWorkoutCopyWith<PendingWorkout> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingWorkoutCopyWith<$Res> {
  factory $PendingWorkoutCopyWith(
          PendingWorkout value, $Res Function(PendingWorkout) then) =
      _$PendingWorkoutCopyWithImpl<$Res, PendingWorkout>;
  @useResult
  $Res call(
      {Workout workout,
      List<WorkoutRoute> routes,
      WorkoutMetrics workoutMetrics});

  $WorkoutCopyWith<$Res> get workout;
  $WorkoutMetricsCopyWith<$Res> get workoutMetrics;
}

/// @nodoc
class _$PendingWorkoutCopyWithImpl<$Res, $Val extends PendingWorkout>
    implements $PendingWorkoutCopyWith<$Res> {
  _$PendingWorkoutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PendingWorkout
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workout = null,
    Object? routes = null,
    Object? workoutMetrics = null,
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
      workoutMetrics: null == workoutMetrics
          ? _value.workoutMetrics
          : workoutMetrics // ignore: cast_nullable_to_non_nullable
              as WorkoutMetrics,
    ) as $Val);
  }

  /// Create a copy of PendingWorkout
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkoutCopyWith<$Res> get workout {
    return $WorkoutCopyWith<$Res>(_value.workout, (value) {
      return _then(_value.copyWith(workout: value) as $Val);
    });
  }

  /// Create a copy of PendingWorkout
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkoutMetricsCopyWith<$Res> get workoutMetrics {
    return $WorkoutMetricsCopyWith<$Res>(_value.workoutMetrics, (value) {
      return _then(_value.copyWith(workoutMetrics: value) as $Val);
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
  $Res call(
      {Workout workout,
      List<WorkoutRoute> routes,
      WorkoutMetrics workoutMetrics});

  @override
  $WorkoutCopyWith<$Res> get workout;
  @override
  $WorkoutMetricsCopyWith<$Res> get workoutMetrics;
}

/// @nodoc
class __$$PendingWorkoutImplCopyWithImpl<$Res>
    extends _$PendingWorkoutCopyWithImpl<$Res, _$PendingWorkoutImpl>
    implements _$$PendingWorkoutImplCopyWith<$Res> {
  __$$PendingWorkoutImplCopyWithImpl(
      _$PendingWorkoutImpl _value, $Res Function(_$PendingWorkoutImpl) _then)
      : super(_value, _then);

  /// Create a copy of PendingWorkout
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workout = null,
    Object? routes = null,
    Object? workoutMetrics = null,
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
      workoutMetrics: null == workoutMetrics
          ? _value.workoutMetrics
          : workoutMetrics // ignore: cast_nullable_to_non_nullable
              as WorkoutMetrics,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PendingWorkoutImpl implements _PendingWorkout {
  const _$PendingWorkoutImpl(
      {required this.workout,
      required final List<WorkoutRoute> routes,
      required this.workoutMetrics})
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
  final WorkoutMetrics workoutMetrics;

  @override
  String toString() {
    return 'PendingWorkout(workout: $workout, routes: $routes, workoutMetrics: $workoutMetrics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PendingWorkoutImpl &&
            (identical(other.workout, workout) || other.workout == workout) &&
            const DeepCollectionEquality().equals(other._routes, _routes) &&
            (identical(other.workoutMetrics, workoutMetrics) ||
                other.workoutMetrics == workoutMetrics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, workout,
      const DeepCollectionEquality().hash(_routes), workoutMetrics);

  /// Create a copy of PendingWorkout
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      required final List<WorkoutRoute> routes,
      required final WorkoutMetrics workoutMetrics}) = _$PendingWorkoutImpl;

  factory _PendingWorkout.fromJson(Map<String, dynamic> json) =
      _$PendingWorkoutImpl.fromJson;

  @override
  Workout get workout;
  @override
  List<WorkoutRoute> get routes;
  @override
  WorkoutMetrics get workoutMetrics;

  /// Create a copy of PendingWorkout
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PendingWorkoutImplCopyWith<_$PendingWorkoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
