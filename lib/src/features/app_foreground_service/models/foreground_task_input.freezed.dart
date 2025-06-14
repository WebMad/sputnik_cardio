// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'foreground_task_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ForegroundTaskInput _$ForegroundTaskInputFromJson(Map<String, dynamic> json) {
  return _ForegroundTaskInput.fromJson(json);
}

/// @nodoc
mixin _$ForegroundTaskInput {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() location,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? location,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? location,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ForegroundTaskInput value) location,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ForegroundTaskInput value)? location,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ForegroundTaskInput value)? location,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this ForegroundTaskInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForegroundTaskInputCopyWith<$Res> {
  factory $ForegroundTaskInputCopyWith(
          ForegroundTaskInput value, $Res Function(ForegroundTaskInput) then) =
      _$ForegroundTaskInputCopyWithImpl<$Res, ForegroundTaskInput>;
}

/// @nodoc
class _$ForegroundTaskInputCopyWithImpl<$Res, $Val extends ForegroundTaskInput>
    implements $ForegroundTaskInputCopyWith<$Res> {
  _$ForegroundTaskInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForegroundTaskInput
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ForegroundTaskInputImplCopyWith<$Res> {
  factory _$$ForegroundTaskInputImplCopyWith(_$ForegroundTaskInputImpl value,
          $Res Function(_$ForegroundTaskInputImpl) then) =
      __$$ForegroundTaskInputImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ForegroundTaskInputImplCopyWithImpl<$Res>
    extends _$ForegroundTaskInputCopyWithImpl<$Res, _$ForegroundTaskInputImpl>
    implements _$$ForegroundTaskInputImplCopyWith<$Res> {
  __$$ForegroundTaskInputImplCopyWithImpl(_$ForegroundTaskInputImpl _value,
      $Res Function(_$ForegroundTaskInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForegroundTaskInput
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ForegroundTaskInputImpl
    with DiagnosticableTreeMixin
    implements _ForegroundTaskInput {
  const _$ForegroundTaskInputImpl();

  factory _$ForegroundTaskInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForegroundTaskInputImplFromJson(json);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ForegroundTaskInput.location()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ForegroundTaskInput.location'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForegroundTaskInputImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() location,
  }) {
    return location();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? location,
  }) {
    return location?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? location,
    required TResult orElse(),
  }) {
    if (location != null) {
      return location();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ForegroundTaskInput value) location,
  }) {
    return location(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ForegroundTaskInput value)? location,
  }) {
    return location?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ForegroundTaskInput value)? location,
    required TResult orElse(),
  }) {
    if (location != null) {
      return location(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ForegroundTaskInputImplToJson(
      this,
    );
  }
}

abstract class _ForegroundTaskInput implements ForegroundTaskInput {
  const factory _ForegroundTaskInput() = _$ForegroundTaskInputImpl;

  factory _ForegroundTaskInput.fromJson(Map<String, dynamic> json) =
      _$ForegroundTaskInputImpl.fromJson;
}
