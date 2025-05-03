// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detailed_workout.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailedWorkout _$DetailedWorkoutFromJson(Map<String, dynamic> json) {
  return _DetailedWorkout.fromJson(json);
}

/// @nodoc
mixin _$DetailedWorkout {
  Workout get workout => throw _privateConstructorUsedError;
  Map<String, List<ExtendedPos>> get routes =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailedWorkoutCopyWith<DetailedWorkout> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailedWorkoutCopyWith<$Res> {
  factory $DetailedWorkoutCopyWith(
          DetailedWorkout value, $Res Function(DetailedWorkout) then) =
      _$DetailedWorkoutCopyWithImpl<$Res, DetailedWorkout>;
  @useResult
  $Res call({Workout workout, Map<String, List<ExtendedPos>> routes});

  $WorkoutCopyWith<$Res> get workout;
}

/// @nodoc
class _$DetailedWorkoutCopyWithImpl<$Res, $Val extends DetailedWorkout>
    implements $DetailedWorkoutCopyWith<$Res> {
  _$DetailedWorkoutCopyWithImpl(this._value, this._then);

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
              as Map<String, List<ExtendedPos>>,
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
abstract class _$$DetailedWorkoutImplCopyWith<$Res>
    implements $DetailedWorkoutCopyWith<$Res> {
  factory _$$DetailedWorkoutImplCopyWith(_$DetailedWorkoutImpl value,
          $Res Function(_$DetailedWorkoutImpl) then) =
      __$$DetailedWorkoutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Workout workout, Map<String, List<ExtendedPos>> routes});

  @override
  $WorkoutCopyWith<$Res> get workout;
}

/// @nodoc
class __$$DetailedWorkoutImplCopyWithImpl<$Res>
    extends _$DetailedWorkoutCopyWithImpl<$Res, _$DetailedWorkoutImpl>
    implements _$$DetailedWorkoutImplCopyWith<$Res> {
  __$$DetailedWorkoutImplCopyWithImpl(
      _$DetailedWorkoutImpl _value, $Res Function(_$DetailedWorkoutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workout = null,
    Object? routes = null,
  }) {
    return _then(_$DetailedWorkoutImpl(
      workout: null == workout
          ? _value.workout
          : workout // ignore: cast_nullable_to_non_nullable
              as Workout,
      routes: null == routes
          ? _value._routes
          : routes // ignore: cast_nullable_to_non_nullable
              as Map<String, List<ExtendedPos>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailedWorkoutImpl
    with DiagnosticableTreeMixin
    implements _DetailedWorkout {
  const _$DetailedWorkoutImpl(
      {required this.workout,
      required final Map<String, List<ExtendedPos>> routes})
      : _routes = routes;

  factory _$DetailedWorkoutImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailedWorkoutImplFromJson(json);

  @override
  final Workout workout;
  final Map<String, List<ExtendedPos>> _routes;
  @override
  Map<String, List<ExtendedPos>> get routes {
    if (_routes is EqualUnmodifiableMapView) return _routes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_routes);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DetailedWorkout(workout: $workout, routes: $routes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DetailedWorkout'))
      ..add(DiagnosticsProperty('workout', workout))
      ..add(DiagnosticsProperty('routes', routes));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailedWorkoutImpl &&
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
  _$$DetailedWorkoutImplCopyWith<_$DetailedWorkoutImpl> get copyWith =>
      __$$DetailedWorkoutImplCopyWithImpl<_$DetailedWorkoutImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailedWorkoutImplToJson(
      this,
    );
  }
}

abstract class _DetailedWorkout implements DetailedWorkout {
  const factory _DetailedWorkout(
          {required final Workout workout,
          required final Map<String, List<ExtendedPos>> routes}) =
      _$DetailedWorkoutImpl;

  factory _DetailedWorkout.fromJson(Map<String, dynamic> json) =
      _$DetailedWorkoutImpl.fromJson;

  @override
  Workout get workout;
  @override
  Map<String, List<ExtendedPos>> get routes;
  @override
  @JsonKey(ignore: true)
  _$$DetailedWorkoutImplCopyWith<_$DetailedWorkoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
