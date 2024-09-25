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
    required TResult Function() played,
    required TResult Function() paused,
    required TResult Function() stopped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? played,
    TResult? Function()? paused,
    TResult? Function()? stopped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? played,
    TResult Function()? paused,
    TResult Function()? stopped,
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
    required TResult Function() played,
    required TResult Function() paused,
    required TResult Function() stopped,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? played,
    TResult? Function()? paused,
    TResult? Function()? stopped,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? played,
    TResult Function()? paused,
    TResult Function()? stopped,
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
}

/// @nodoc
class __$$PlayedTrackingModelImplCopyWithImpl<$Res>
    extends _$TrackingModelCopyWithImpl<$Res, _$PlayedTrackingModelImpl>
    implements _$$PlayedTrackingModelImplCopyWith<$Res> {
  __$$PlayedTrackingModelImplCopyWithImpl(_$PlayedTrackingModelImpl _value,
      $Res Function(_$PlayedTrackingModelImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PlayedTrackingModelImpl
    with DiagnosticableTreeMixin
    implements _PlayedTrackingModel {
  const _$PlayedTrackingModelImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrackingModel.played()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'TrackingModel.played'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayedTrackingModelImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() played,
    required TResult Function() paused,
    required TResult Function() stopped,
  }) {
    return played();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? played,
    TResult? Function()? paused,
    TResult? Function()? stopped,
  }) {
    return played?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? played,
    TResult Function()? paused,
    TResult Function()? stopped,
    required TResult orElse(),
  }) {
    if (played != null) {
      return played();
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
  const factory _PlayedTrackingModel() = _$PlayedTrackingModelImpl;
}

/// @nodoc
abstract class _$$PausedTrackingModelImplCopyWith<$Res> {
  factory _$$PausedTrackingModelImplCopyWith(_$PausedTrackingModelImpl value,
          $Res Function(_$PausedTrackingModelImpl) then) =
      __$$PausedTrackingModelImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PausedTrackingModelImplCopyWithImpl<$Res>
    extends _$TrackingModelCopyWithImpl<$Res, _$PausedTrackingModelImpl>
    implements _$$PausedTrackingModelImplCopyWith<$Res> {
  __$$PausedTrackingModelImplCopyWithImpl(_$PausedTrackingModelImpl _value,
      $Res Function(_$PausedTrackingModelImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PausedTrackingModelImpl
    with DiagnosticableTreeMixin
    implements _PausedTrackingModel {
  const _$PausedTrackingModelImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrackingModel.paused()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'TrackingModel.paused'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PausedTrackingModelImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() played,
    required TResult Function() paused,
    required TResult Function() stopped,
  }) {
    return paused();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? played,
    TResult? Function()? paused,
    TResult? Function()? stopped,
  }) {
    return paused?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? played,
    TResult Function()? paused,
    TResult Function()? stopped,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused();
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
  const factory _PausedTrackingModel() = _$PausedTrackingModelImpl;
}

/// @nodoc
abstract class _$$StoppedTrackingModelImplCopyWith<$Res> {
  factory _$$StoppedTrackingModelImplCopyWith(_$StoppedTrackingModelImpl value,
          $Res Function(_$StoppedTrackingModelImpl) then) =
      __$$StoppedTrackingModelImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StoppedTrackingModelImplCopyWithImpl<$Res>
    extends _$TrackingModelCopyWithImpl<$Res, _$StoppedTrackingModelImpl>
    implements _$$StoppedTrackingModelImplCopyWith<$Res> {
  __$$StoppedTrackingModelImplCopyWithImpl(_$StoppedTrackingModelImpl _value,
      $Res Function(_$StoppedTrackingModelImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StoppedTrackingModelImpl
    with DiagnosticableTreeMixin
    implements _StoppedTrackingModel {
  const _$StoppedTrackingModelImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrackingModel.stopped()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'TrackingModel.stopped'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoppedTrackingModelImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() played,
    required TResult Function() paused,
    required TResult Function() stopped,
  }) {
    return stopped();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? played,
    TResult? Function()? paused,
    TResult? Function()? stopped,
  }) {
    return stopped?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? played,
    TResult Function()? paused,
    TResult Function()? stopped,
    required TResult orElse(),
  }) {
    if (stopped != null) {
      return stopped();
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
  const factory _StoppedTrackingModel() = _$StoppedTrackingModelImpl;
}
