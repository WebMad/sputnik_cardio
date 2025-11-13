// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProgressScreenState {
  List<DetailedWorkout> get lastWeekWorkouts =>
      throw _privateConstructorUsedError;
  ProgressScreenStatus get status => throw _privateConstructorUsedError;
  List<double> get chartData => throw _privateConstructorUsedError;

  /// Create a copy of ProgressScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProgressScreenStateCopyWith<ProgressScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressScreenStateCopyWith<$Res> {
  factory $ProgressScreenStateCopyWith(
          ProgressScreenState value, $Res Function(ProgressScreenState) then) =
      _$ProgressScreenStateCopyWithImpl<$Res, ProgressScreenState>;
  @useResult
  $Res call(
      {List<DetailedWorkout> lastWeekWorkouts,
      ProgressScreenStatus status,
      List<double> chartData});
}

/// @nodoc
class _$ProgressScreenStateCopyWithImpl<$Res, $Val extends ProgressScreenState>
    implements $ProgressScreenStateCopyWith<$Res> {
  _$ProgressScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProgressScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastWeekWorkouts = null,
    Object? status = null,
    Object? chartData = null,
  }) {
    return _then(_value.copyWith(
      lastWeekWorkouts: null == lastWeekWorkouts
          ? _value.lastWeekWorkouts
          : lastWeekWorkouts // ignore: cast_nullable_to_non_nullable
              as List<DetailedWorkout>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProgressScreenStatus,
      chartData: null == chartData
          ? _value.chartData
          : chartData // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProgressScreenStateImplCopyWith<$Res>
    implements $ProgressScreenStateCopyWith<$Res> {
  factory _$$ProgressScreenStateImplCopyWith(_$ProgressScreenStateImpl value,
          $Res Function(_$ProgressScreenStateImpl) then) =
      __$$ProgressScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DetailedWorkout> lastWeekWorkouts,
      ProgressScreenStatus status,
      List<double> chartData});
}

/// @nodoc
class __$$ProgressScreenStateImplCopyWithImpl<$Res>
    extends _$ProgressScreenStateCopyWithImpl<$Res, _$ProgressScreenStateImpl>
    implements _$$ProgressScreenStateImplCopyWith<$Res> {
  __$$ProgressScreenStateImplCopyWithImpl(_$ProgressScreenStateImpl _value,
      $Res Function(_$ProgressScreenStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProgressScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastWeekWorkouts = null,
    Object? status = null,
    Object? chartData = null,
  }) {
    return _then(_$ProgressScreenStateImpl(
      lastWeekWorkouts: null == lastWeekWorkouts
          ? _value._lastWeekWorkouts
          : lastWeekWorkouts // ignore: cast_nullable_to_non_nullable
              as List<DetailedWorkout>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProgressScreenStatus,
      chartData: null == chartData
          ? _value._chartData
          : chartData // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc

class _$ProgressScreenStateImpl implements _ProgressScreenState {
  const _$ProgressScreenStateImpl(
      {required final List<DetailedWorkout> lastWeekWorkouts,
      required this.status,
      required final List<double> chartData})
      : _lastWeekWorkouts = lastWeekWorkouts,
        _chartData = chartData;

  final List<DetailedWorkout> _lastWeekWorkouts;
  @override
  List<DetailedWorkout> get lastWeekWorkouts {
    if (_lastWeekWorkouts is EqualUnmodifiableListView)
      return _lastWeekWorkouts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lastWeekWorkouts);
  }

  @override
  final ProgressScreenStatus status;
  final List<double> _chartData;
  @override
  List<double> get chartData {
    if (_chartData is EqualUnmodifiableListView) return _chartData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chartData);
  }

  @override
  String toString() {
    return 'ProgressScreenState(lastWeekWorkouts: $lastWeekWorkouts, status: $status, chartData: $chartData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgressScreenStateImpl &&
            const DeepCollectionEquality()
                .equals(other._lastWeekWorkouts, _lastWeekWorkouts) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._chartData, _chartData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_lastWeekWorkouts),
      status,
      const DeepCollectionEquality().hash(_chartData));

  /// Create a copy of ProgressScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgressScreenStateImplCopyWith<_$ProgressScreenStateImpl> get copyWith =>
      __$$ProgressScreenStateImplCopyWithImpl<_$ProgressScreenStateImpl>(
          this, _$identity);
}

abstract class _ProgressScreenState implements ProgressScreenState {
  const factory _ProgressScreenState(
      {required final List<DetailedWorkout> lastWeekWorkouts,
      required final ProgressScreenStatus status,
      required final List<double> chartData}) = _$ProgressScreenStateImpl;

  @override
  List<DetailedWorkout> get lastWeekWorkouts;
  @override
  ProgressScreenStatus get status;
  @override
  List<double> get chartData;

  /// Create a copy of ProgressScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProgressScreenStateImplCopyWith<_$ProgressScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
