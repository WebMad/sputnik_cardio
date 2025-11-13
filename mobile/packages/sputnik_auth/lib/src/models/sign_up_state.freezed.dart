// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignUpState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() filling,
    required TResult Function(Set<SignUpError> errors) error,
    required TResult Function() created,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? filling,
    TResult? Function(Set<SignUpError> errors)? error,
    TResult? Function()? created,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? filling,
    TResult Function(Set<SignUpError> errors)? error,
    TResult Function()? created,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Filling value) filling,
    required TResult Function(_Error value) error,
    required TResult Function(_Created value) created,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Filling value)? filling,
    TResult? Function(_Error value)? error,
    TResult? Function(_Created value)? created,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Filling value)? filling,
    TResult Function(_Error value)? error,
    TResult Function(_Created value)? created,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res, SignUpState>;
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res, $Val extends SignUpState>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FillingImplCopyWith<$Res> {
  factory _$$FillingImplCopyWith(
          _$FillingImpl value, $Res Function(_$FillingImpl) then) =
      __$$FillingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FillingImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$FillingImpl>
    implements _$$FillingImplCopyWith<$Res> {
  __$$FillingImplCopyWithImpl(
      _$FillingImpl _value, $Res Function(_$FillingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FillingImpl with DiagnosticableTreeMixin implements _Filling {
  const _$FillingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignUpState.filling()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SignUpState.filling'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FillingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() filling,
    required TResult Function(Set<SignUpError> errors) error,
    required TResult Function() created,
  }) {
    return filling();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? filling,
    TResult? Function(Set<SignUpError> errors)? error,
    TResult? Function()? created,
  }) {
    return filling?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? filling,
    TResult Function(Set<SignUpError> errors)? error,
    TResult Function()? created,
    required TResult orElse(),
  }) {
    if (filling != null) {
      return filling();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Filling value) filling,
    required TResult Function(_Error value) error,
    required TResult Function(_Created value) created,
  }) {
    return filling(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Filling value)? filling,
    TResult? Function(_Error value)? error,
    TResult? Function(_Created value)? created,
  }) {
    return filling?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Filling value)? filling,
    TResult Function(_Error value)? error,
    TResult Function(_Created value)? created,
    required TResult orElse(),
  }) {
    if (filling != null) {
      return filling(this);
    }
    return orElse();
  }
}

abstract class _Filling implements SignUpState {
  const factory _Filling() = _$FillingImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Set<SignUpError> errors});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errors = null,
  }) {
    return _then(_$ErrorImpl(
      errors: null == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Set<SignUpError>,
    ));
  }
}

/// @nodoc

class _$ErrorImpl with DiagnosticableTreeMixin implements _Error {
  const _$ErrorImpl({required final Set<SignUpError> errors})
      : _errors = errors;

  final Set<SignUpError> _errors;
  @override
  Set<SignUpError> get errors {
    if (_errors is EqualUnmodifiableSetView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_errors);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignUpState.error(errors: $errors)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignUpState.error'))
      ..add(DiagnosticsProperty('errors', errors));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_errors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() filling,
    required TResult Function(Set<SignUpError> errors) error,
    required TResult Function() created,
  }) {
    return error(errors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? filling,
    TResult? Function(Set<SignUpError> errors)? error,
    TResult? Function()? created,
  }) {
    return error?.call(errors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? filling,
    TResult Function(Set<SignUpError> errors)? error,
    TResult Function()? created,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Filling value) filling,
    required TResult Function(_Error value) error,
    required TResult Function(_Created value) created,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Filling value)? filling,
    TResult? Function(_Error value)? error,
    TResult? Function(_Created value)? created,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Filling value)? filling,
    TResult Function(_Error value)? error,
    TResult Function(_Created value)? created,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements SignUpState {
  const factory _Error({required final Set<SignUpError> errors}) = _$ErrorImpl;

  Set<SignUpError> get errors;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreatedImplCopyWith<$Res> {
  factory _$$CreatedImplCopyWith(
          _$CreatedImpl value, $Res Function(_$CreatedImpl) then) =
      __$$CreatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreatedImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$CreatedImpl>
    implements _$$CreatedImplCopyWith<$Res> {
  __$$CreatedImplCopyWithImpl(
      _$CreatedImpl _value, $Res Function(_$CreatedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreatedImpl with DiagnosticableTreeMixin implements _Created {
  const _$CreatedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignUpState.created()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SignUpState.created'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() filling,
    required TResult Function(Set<SignUpError> errors) error,
    required TResult Function() created,
  }) {
    return created();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? filling,
    TResult? Function(Set<SignUpError> errors)? error,
    TResult? Function()? created,
  }) {
    return created?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? filling,
    TResult Function(Set<SignUpError> errors)? error,
    TResult Function()? created,
    required TResult orElse(),
  }) {
    if (created != null) {
      return created();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Filling value) filling,
    required TResult Function(_Error value) error,
    required TResult Function(_Created value) created,
  }) {
    return created(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Filling value)? filling,
    TResult? Function(_Error value)? error,
    TResult? Function(_Created value)? created,
  }) {
    return created?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Filling value)? filling,
    TResult Function(_Error value)? error,
    TResult Function(_Created value)? created,
    required TResult orElse(),
  }) {
    if (created != null) {
      return created(this);
    }
    return orElse();
  }
}

abstract class _Created implements SignUpState {
  const factory _Created() = _$CreatedImpl;
}
