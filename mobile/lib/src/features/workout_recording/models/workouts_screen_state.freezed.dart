// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workouts_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WorkoutsScreenState {
  List<DetailedWorkout> get workouts => throw _privateConstructorUsedError;
  WorkoutsScreenStatus get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  bool get showErrorBanner => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutsScreenStateCopyWith<WorkoutsScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutsScreenStateCopyWith<$Res> {
  factory $WorkoutsScreenStateCopyWith(
          WorkoutsScreenState value, $Res Function(WorkoutsScreenState) then) =
      _$WorkoutsScreenStateCopyWithImpl<$Res, WorkoutsScreenState>;
  @useResult
  $Res call(
      {List<DetailedWorkout> workouts,
      WorkoutsScreenStatus status,
      String? errorMessage,
      bool showErrorBanner});
}

/// @nodoc
class _$WorkoutsScreenStateCopyWithImpl<$Res, $Val extends WorkoutsScreenState>
    implements $WorkoutsScreenStateCopyWith<$Res> {
  _$WorkoutsScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workouts = null,
    Object? status = null,
    Object? errorMessage = freezed,
    Object? showErrorBanner = null,
  }) {
    return _then(_value.copyWith(
      workouts: null == workouts
          ? _value.workouts
          : workouts // ignore: cast_nullable_to_non_nullable
              as List<DetailedWorkout>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WorkoutsScreenStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      showErrorBanner: null == showErrorBanner
          ? _value.showErrorBanner
          : showErrorBanner // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutsScreenStateImplCopyWith<$Res>
    implements $WorkoutsScreenStateCopyWith<$Res> {
  factory _$$WorkoutsScreenStateImplCopyWith(_$WorkoutsScreenStateImpl value,
          $Res Function(_$WorkoutsScreenStateImpl) then) =
      __$$WorkoutsScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DetailedWorkout> workouts,
      WorkoutsScreenStatus status,
      String? errorMessage,
      bool showErrorBanner});
}

/// @nodoc
class __$$WorkoutsScreenStateImplCopyWithImpl<$Res>
    extends _$WorkoutsScreenStateCopyWithImpl<$Res, _$WorkoutsScreenStateImpl>
    implements _$$WorkoutsScreenStateImplCopyWith<$Res> {
  __$$WorkoutsScreenStateImplCopyWithImpl(_$WorkoutsScreenStateImpl _value,
      $Res Function(_$WorkoutsScreenStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkoutsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workouts = null,
    Object? status = null,
    Object? errorMessage = freezed,
    Object? showErrorBanner = null,
  }) {
    return _then(_$WorkoutsScreenStateImpl(
      workouts: null == workouts
          ? _value._workouts
          : workouts // ignore: cast_nullable_to_non_nullable
              as List<DetailedWorkout>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WorkoutsScreenStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      showErrorBanner: null == showErrorBanner
          ? _value.showErrorBanner
          : showErrorBanner // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$WorkoutsScreenStateImpl extends _WorkoutsScreenState {
  const _$WorkoutsScreenStateImpl(
      {required final List<DetailedWorkout> workouts,
      required this.status,
      this.errorMessage,
      this.showErrorBanner = false})
      : _workouts = workouts,
        super._();

  final List<DetailedWorkout> _workouts;
  @override
  List<DetailedWorkout> get workouts {
    if (_workouts is EqualUnmodifiableListView) return _workouts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workouts);
  }

  @override
  final WorkoutsScreenStatus status;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final bool showErrorBanner;

  @override
  String toString() {
    return 'WorkoutsScreenState(workouts: $workouts, status: $status, errorMessage: $errorMessage, showErrorBanner: $showErrorBanner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutsScreenStateImpl &&
            const DeepCollectionEquality().equals(other._workouts, _workouts) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.showErrorBanner, showErrorBanner) ||
                other.showErrorBanner == showErrorBanner));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_workouts),
      status,
      errorMessage,
      showErrorBanner);

  /// Create a copy of WorkoutsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutsScreenStateImplCopyWith<_$WorkoutsScreenStateImpl> get copyWith =>
      __$$WorkoutsScreenStateImplCopyWithImpl<_$WorkoutsScreenStateImpl>(
          this, _$identity);
}

abstract class _WorkoutsScreenState extends WorkoutsScreenState {
  const factory _WorkoutsScreenState(
      {required final List<DetailedWorkout> workouts,
      required final WorkoutsScreenStatus status,
      final String? errorMessage,
      final bool showErrorBanner}) = _$WorkoutsScreenStateImpl;
  const _WorkoutsScreenState._() : super._();

  @override
  List<DetailedWorkout> get workouts;
  @override
  WorkoutsScreenStatus get status;
  @override
  String? get errorMessage;
  @override
  bool get showErrorBanner;

  /// Create a copy of WorkoutsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutsScreenStateImplCopyWith<_$WorkoutsScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
