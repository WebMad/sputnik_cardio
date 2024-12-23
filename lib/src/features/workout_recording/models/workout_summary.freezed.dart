// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkoutSummary _$WorkoutSummaryFromJson(Map<String, dynamic> json) {
  return _WorkoutSummary.fromJson(json);
}

/// @nodoc
mixin _$WorkoutSummary {
  Workout get workout => throw _privateConstructorUsedError;
  WorkoutMetrics get metrics => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkoutSummaryCopyWith<WorkoutSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutSummaryCopyWith<$Res> {
  factory $WorkoutSummaryCopyWith(
          WorkoutSummary value, $Res Function(WorkoutSummary) then) =
      _$WorkoutSummaryCopyWithImpl<$Res, WorkoutSummary>;
  @useResult
  $Res call({Workout workout, WorkoutMetrics metrics});

  $WorkoutCopyWith<$Res> get workout;
  $WorkoutMetricsCopyWith<$Res> get metrics;
}

/// @nodoc
class _$WorkoutSummaryCopyWithImpl<$Res, $Val extends WorkoutSummary>
    implements $WorkoutSummaryCopyWith<$Res> {
  _$WorkoutSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workout = null,
    Object? metrics = null,
  }) {
    return _then(_value.copyWith(
      workout: null == workout
          ? _value.workout
          : workout // ignore: cast_nullable_to_non_nullable
              as Workout,
      metrics: null == metrics
          ? _value.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as WorkoutMetrics,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WorkoutCopyWith<$Res> get workout {
    return $WorkoutCopyWith<$Res>(_value.workout, (value) {
      return _then(_value.copyWith(workout: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WorkoutMetricsCopyWith<$Res> get metrics {
    return $WorkoutMetricsCopyWith<$Res>(_value.metrics, (value) {
      return _then(_value.copyWith(metrics: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WorkoutSummaryImplCopyWith<$Res>
    implements $WorkoutSummaryCopyWith<$Res> {
  factory _$$WorkoutSummaryImplCopyWith(_$WorkoutSummaryImpl value,
          $Res Function(_$WorkoutSummaryImpl) then) =
      __$$WorkoutSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Workout workout, WorkoutMetrics metrics});

  @override
  $WorkoutCopyWith<$Res> get workout;
  @override
  $WorkoutMetricsCopyWith<$Res> get metrics;
}

/// @nodoc
class __$$WorkoutSummaryImplCopyWithImpl<$Res>
    extends _$WorkoutSummaryCopyWithImpl<$Res, _$WorkoutSummaryImpl>
    implements _$$WorkoutSummaryImplCopyWith<$Res> {
  __$$WorkoutSummaryImplCopyWithImpl(
      _$WorkoutSummaryImpl _value, $Res Function(_$WorkoutSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workout = null,
    Object? metrics = null,
  }) {
    return _then(_$WorkoutSummaryImpl(
      workout: null == workout
          ? _value.workout
          : workout // ignore: cast_nullable_to_non_nullable
              as Workout,
      metrics: null == metrics
          ? _value.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as WorkoutMetrics,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutSummaryImpl
    with DiagnosticableTreeMixin
    implements _WorkoutSummary {
  const _$WorkoutSummaryImpl({required this.workout, required this.metrics});

  factory _$WorkoutSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutSummaryImplFromJson(json);

  @override
  final Workout workout;
  @override
  final WorkoutMetrics metrics;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WorkoutSummary(workout: $workout, metrics: $metrics)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WorkoutSummary'))
      ..add(DiagnosticsProperty('workout', workout))
      ..add(DiagnosticsProperty('metrics', metrics));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutSummaryImpl &&
            (identical(other.workout, workout) || other.workout == workout) &&
            (identical(other.metrics, metrics) || other.metrics == metrics));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, workout, metrics);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutSummaryImplCopyWith<_$WorkoutSummaryImpl> get copyWith =>
      __$$WorkoutSummaryImplCopyWithImpl<_$WorkoutSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutSummaryImplToJson(
      this,
    );
  }
}

abstract class _WorkoutSummary implements WorkoutSummary {
  const factory _WorkoutSummary(
      {required final Workout workout,
      required final WorkoutMetrics metrics}) = _$WorkoutSummaryImpl;

  factory _WorkoutSummary.fromJson(Map<String, dynamic> json) =
      _$WorkoutSummaryImpl.fromJson;

  @override
  Workout get workout;
  @override
  WorkoutMetrics get metrics;
  @override
  @JsonKey(ignore: true)
  _$$WorkoutSummaryImplCopyWith<_$WorkoutSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
