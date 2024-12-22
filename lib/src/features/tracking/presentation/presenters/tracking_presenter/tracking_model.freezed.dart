// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tracking_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TrackingModel {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Workout workout) played,
    required TResult Function(Workout workout) paused,
    required TResult Function(Workout workout) stopped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Workout workout)? played,
    TResult? Function(Workout workout)? paused,
    TResult? Function(Workout workout)? stopped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Workout workout)? played,
    TResult Function(Workout workout)? paused,
    TResult Function(Workout workout)? stopped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialTrackingModel value) initial,
    required TResult Function(_PlayedTrackingModel value) played,
    required TResult Function(_PausedTrackingModel value) paused,
    required TResult Function(_StoppedTrackingModel value) stopped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialTrackingModel value)? initial,
    TResult? Function(_PlayedTrackingModel value)? played,
    TResult? Function(_PausedTrackingModel value)? paused,
    TResult? Function(_StoppedTrackingModel value)? stopped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialTrackingModel value)? initial,
    TResult Function(_PlayedTrackingModel value)? played,
    TResult Function(_PausedTrackingModel value)? paused,
    TResult Function(_StoppedTrackingModel value)? stopped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackingModelCopyWith<$Res> {
  factory $TrackingModelCopyWith(
          TrackingModel value, $Res Function(TrackingModel) then) =
      _$TrackingModelCopyWithImpl<$Res, TrackingModel>;
}

/// @nodoc
class _$TrackingModelCopyWithImpl<$Res, $Val extends TrackingModel>
    implements $TrackingModelCopyWith<$Res> {
  _$TrackingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialTrackingModelImplCopyWith<$Res> {
  factory _$$InitialTrackingModelImplCopyWith(_$InitialTrackingModelImpl value,
          $Res Function(_$InitialTrackingModelImpl) then) =
      __$$InitialTrackingModelImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialTrackingModelImplCopyWithImpl<$Res>
    extends _$TrackingModelCopyWithImpl<$Res, _$InitialTrackingModelImpl>
    implements _$$InitialTrackingModelImplCopyWith<$Res> {
  __$$InitialTrackingModelImplCopyWithImpl(_$InitialTrackingModelImpl _value,
      $Res Function(_$InitialTrackingModelImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialTrackingModelImpl
    with DiagnosticableTreeMixin
    implements _InitialTrackingModel {
  const _$InitialTrackingModelImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrackingModel.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'TrackingModel.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialTrackingModelImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Workout workout) played,
    required TResult Function(Workout workout) paused,
    required TResult Function(Workout workout) stopped,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Workout workout)? played,
    TResult? Function(Workout workout)? paused,
    TResult? Function(Workout workout)? stopped,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Workout workout)? played,
    TResult Function(Workout workout)? paused,
    TResult Function(Workout workout)? stopped,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialTrackingModel value) initial,
    required TResult Function(_PlayedTrackingModel value) played,
    required TResult Function(_PausedTrackingModel value) paused,
    required TResult Function(_StoppedTrackingModel value) stopped,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialTrackingModel value)? initial,
    TResult? Function(_PlayedTrackingModel value)? played,
    TResult? Function(_PausedTrackingModel value)? paused,
    TResult? Function(_StoppedTrackingModel value)? stopped,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialTrackingModel value)? initial,
    TResult Function(_PlayedTrackingModel value)? played,
    TResult Function(_PausedTrackingModel value)? paused,
    TResult Function(_StoppedTrackingModel value)? stopped,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialTrackingModel implements TrackingModel {
  const factory _InitialTrackingModel() = _$InitialTrackingModelImpl;
}

/// @nodoc
abstract class _$$PlayedTrackingModelImplCopyWith<$Res> {
  factory _$$PlayedTrackingModelImplCopyWith(_$PlayedTrackingModelImpl value,
          $Res Function(_$PlayedTrackingModelImpl) then) =
      __$$PlayedTrackingModelImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Workout workout});

  $WorkoutCopyWith<$Res> get workout;
}

/// @nodoc
class __$$PlayedTrackingModelImplCopyWithImpl<$Res>
    extends _$TrackingModelCopyWithImpl<$Res, _$PlayedTrackingModelImpl>
    implements _$$PlayedTrackingModelImplCopyWith<$Res> {
  __$$PlayedTrackingModelImplCopyWithImpl(_$PlayedTrackingModelImpl _value,
      $Res Function(_$PlayedTrackingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workout = null,
  }) {
    return _then(_$PlayedTrackingModelImpl(
      workout: null == workout
          ? _value.workout
          : workout // ignore: cast_nullable_to_non_nullable
              as Workout,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $WorkoutCopyWith<$Res> get workout {
    return $WorkoutCopyWith<$Res>(_value.workout, (value) {
      return _then(_value.copyWith(workout: value));
    });
  }
}

/// @nodoc

class _$PlayedTrackingModelImpl
    with DiagnosticableTreeMixin
    implements _PlayedTrackingModel {
  const _$PlayedTrackingModelImpl({required this.workout});

  @override
  final Workout workout;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrackingModel.played(workout: $workout)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TrackingModel.played'))
      ..add(DiagnosticsProperty('workout', workout));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayedTrackingModelImpl &&
            (identical(other.workout, workout) || other.workout == workout));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workout);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayedTrackingModelImplCopyWith<_$PlayedTrackingModelImpl> get copyWith =>
      __$$PlayedTrackingModelImplCopyWithImpl<_$PlayedTrackingModelImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Workout workout) played,
    required TResult Function(Workout workout) paused,
    required TResult Function(Workout workout) stopped,
  }) {
    return played(workout);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Workout workout)? played,
    TResult? Function(Workout workout)? paused,
    TResult? Function(Workout workout)? stopped,
  }) {
    return played?.call(workout);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Workout workout)? played,
    TResult Function(Workout workout)? paused,
    TResult Function(Workout workout)? stopped,
    required TResult orElse(),
  }) {
    if (played != null) {
      return played(workout);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialTrackingModel value) initial,
    required TResult Function(_PlayedTrackingModel value) played,
    required TResult Function(_PausedTrackingModel value) paused,
    required TResult Function(_StoppedTrackingModel value) stopped,
  }) {
    return played(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialTrackingModel value)? initial,
    TResult? Function(_PlayedTrackingModel value)? played,
    TResult? Function(_PausedTrackingModel value)? paused,
    TResult? Function(_StoppedTrackingModel value)? stopped,
  }) {
    return played?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialTrackingModel value)? initial,
    TResult Function(_PlayedTrackingModel value)? played,
    TResult Function(_PausedTrackingModel value)? paused,
    TResult Function(_StoppedTrackingModel value)? stopped,
    required TResult orElse(),
  }) {
    if (played != null) {
      return played(this);
    }
    return orElse();
  }
}

abstract class _PlayedTrackingModel implements TrackingModel {
  const factory _PlayedTrackingModel({required final Workout workout}) =
      _$PlayedTrackingModelImpl;

  Workout get workout;
  @JsonKey(ignore: true)
  _$$PlayedTrackingModelImplCopyWith<_$PlayedTrackingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PausedTrackingModelImplCopyWith<$Res> {
  factory _$$PausedTrackingModelImplCopyWith(_$PausedTrackingModelImpl value,
          $Res Function(_$PausedTrackingModelImpl) then) =
      __$$PausedTrackingModelImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Workout workout});

  $WorkoutCopyWith<$Res> get workout;
}

/// @nodoc
class __$$PausedTrackingModelImplCopyWithImpl<$Res>
    extends _$TrackingModelCopyWithImpl<$Res, _$PausedTrackingModelImpl>
    implements _$$PausedTrackingModelImplCopyWith<$Res> {
  __$$PausedTrackingModelImplCopyWithImpl(_$PausedTrackingModelImpl _value,
      $Res Function(_$PausedTrackingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workout = null,
  }) {
    return _then(_$PausedTrackingModelImpl(
      workout: null == workout
          ? _value.workout
          : workout // ignore: cast_nullable_to_non_nullable
              as Workout,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $WorkoutCopyWith<$Res> get workout {
    return $WorkoutCopyWith<$Res>(_value.workout, (value) {
      return _then(_value.copyWith(workout: value));
    });
  }
}

/// @nodoc

class _$PausedTrackingModelImpl
    with DiagnosticableTreeMixin
    implements _PausedTrackingModel {
  const _$PausedTrackingModelImpl({required this.workout});

  @override
  final Workout workout;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrackingModel.paused(workout: $workout)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TrackingModel.paused'))
      ..add(DiagnosticsProperty('workout', workout));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PausedTrackingModelImpl &&
            (identical(other.workout, workout) || other.workout == workout));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workout);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PausedTrackingModelImplCopyWith<_$PausedTrackingModelImpl> get copyWith =>
      __$$PausedTrackingModelImplCopyWithImpl<_$PausedTrackingModelImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Workout workout) played,
    required TResult Function(Workout workout) paused,
    required TResult Function(Workout workout) stopped,
  }) {
    return paused(workout);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Workout workout)? played,
    TResult? Function(Workout workout)? paused,
    TResult? Function(Workout workout)? stopped,
  }) {
    return paused?.call(workout);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Workout workout)? played,
    TResult Function(Workout workout)? paused,
    TResult Function(Workout workout)? stopped,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(workout);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialTrackingModel value) initial,
    required TResult Function(_PlayedTrackingModel value) played,
    required TResult Function(_PausedTrackingModel value) paused,
    required TResult Function(_StoppedTrackingModel value) stopped,
  }) {
    return paused(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialTrackingModel value)? initial,
    TResult? Function(_PlayedTrackingModel value)? played,
    TResult? Function(_PausedTrackingModel value)? paused,
    TResult? Function(_StoppedTrackingModel value)? stopped,
  }) {
    return paused?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialTrackingModel value)? initial,
    TResult Function(_PlayedTrackingModel value)? played,
    TResult Function(_PausedTrackingModel value)? paused,
    TResult Function(_StoppedTrackingModel value)? stopped,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(this);
    }
    return orElse();
  }
}

abstract class _PausedTrackingModel implements TrackingModel {
  const factory _PausedTrackingModel({required final Workout workout}) =
      _$PausedTrackingModelImpl;

  Workout get workout;
  @JsonKey(ignore: true)
  _$$PausedTrackingModelImplCopyWith<_$PausedTrackingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StoppedTrackingModelImplCopyWith<$Res> {
  factory _$$StoppedTrackingModelImplCopyWith(_$StoppedTrackingModelImpl value,
          $Res Function(_$StoppedTrackingModelImpl) then) =
      __$$StoppedTrackingModelImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Workout workout});

  $WorkoutCopyWith<$Res> get workout;
}

/// @nodoc
class __$$StoppedTrackingModelImplCopyWithImpl<$Res>
    extends _$TrackingModelCopyWithImpl<$Res, _$StoppedTrackingModelImpl>
    implements _$$StoppedTrackingModelImplCopyWith<$Res> {
  __$$StoppedTrackingModelImplCopyWithImpl(_$StoppedTrackingModelImpl _value,
      $Res Function(_$StoppedTrackingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workout = null,
  }) {
    return _then(_$StoppedTrackingModelImpl(
      workout: null == workout
          ? _value.workout
          : workout // ignore: cast_nullable_to_non_nullable
              as Workout,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $WorkoutCopyWith<$Res> get workout {
    return $WorkoutCopyWith<$Res>(_value.workout, (value) {
      return _then(_value.copyWith(workout: value));
    });
  }
}

/// @nodoc

class _$StoppedTrackingModelImpl
    with DiagnosticableTreeMixin
    implements _StoppedTrackingModel {
  const _$StoppedTrackingModelImpl({required this.workout});

  @override
  final Workout workout;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrackingModel.stopped(workout: $workout)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TrackingModel.stopped'))
      ..add(DiagnosticsProperty('workout', workout));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoppedTrackingModelImpl &&
            (identical(other.workout, workout) || other.workout == workout));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workout);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoppedTrackingModelImplCopyWith<_$StoppedTrackingModelImpl>
      get copyWith =>
          __$$StoppedTrackingModelImplCopyWithImpl<_$StoppedTrackingModelImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Workout workout) played,
    required TResult Function(Workout workout) paused,
    required TResult Function(Workout workout) stopped,
  }) {
    return stopped(workout);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Workout workout)? played,
    TResult? Function(Workout workout)? paused,
    TResult? Function(Workout workout)? stopped,
  }) {
    return stopped?.call(workout);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Workout workout)? played,
    TResult Function(Workout workout)? paused,
    TResult Function(Workout workout)? stopped,
    required TResult orElse(),
  }) {
    if (stopped != null) {
      return stopped(workout);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialTrackingModel value) initial,
    required TResult Function(_PlayedTrackingModel value) played,
    required TResult Function(_PausedTrackingModel value) paused,
    required TResult Function(_StoppedTrackingModel value) stopped,
  }) {
    return stopped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialTrackingModel value)? initial,
    TResult? Function(_PlayedTrackingModel value)? played,
    TResult? Function(_PausedTrackingModel value)? paused,
    TResult? Function(_StoppedTrackingModel value)? stopped,
  }) {
    return stopped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialTrackingModel value)? initial,
    TResult Function(_PlayedTrackingModel value)? played,
    TResult Function(_PausedTrackingModel value)? paused,
    TResult Function(_StoppedTrackingModel value)? stopped,
    required TResult orElse(),
  }) {
    if (stopped != null) {
      return stopped(this);
    }
    return orElse();
  }
}

abstract class _StoppedTrackingModel implements TrackingModel {
  const factory _StoppedTrackingModel({required final Workout workout}) =
      _$StoppedTrackingModelImpl;

  Workout get workout;
  @JsonKey(ignore: true)
  _$$StoppedTrackingModelImplCopyWith<_$StoppedTrackingModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
