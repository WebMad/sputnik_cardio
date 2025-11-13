// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignInState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() filling,
    required TResult Function(Set<SignInError> errors) error,
    required TResult Function() signedIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? filling,
    TResult? Function(Set<SignInError> errors)? error,
    TResult? Function()? signedIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? filling,
    TResult Function(Set<SignInError> errors)? error,
    TResult Function()? signedIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Filling value) filling,
    required TResult Function(_Error value) error,
    required TResult Function(_SignedIn value) signedIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Filling value)? filling,
    TResult? Function(_Error value)? error,
    TResult? Function(_SignedIn value)? signedIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Filling value)? filling,
    TResult Function(_Error value)? error,
    TResult Function(_SignedIn value)? signedIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInStateCopyWith<$Res> {
  factory $SignInStateCopyWith(
          SignInState value, $Res Function(SignInState) then) =
      _$SignInStateCopyWithImpl<$Res, SignInState>;
}

/// @nodoc
class _$SignInStateCopyWithImpl<$Res, $Val extends SignInState>
    implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._value, this._then);

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
    extends _$SignInStateCopyWithImpl<$Res, _$FillingImpl>
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
    return 'SignInState.filling()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SignInState.filling'));
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
    required TResult Function(Set<SignInError> errors) error,
    required TResult Function() signedIn,
  }) {
    return filling();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? filling,
    TResult? Function(Set<SignInError> errors)? error,
    TResult? Function()? signedIn,
  }) {
    return filling?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? filling,
    TResult Function(Set<SignInError> errors)? error,
    TResult Function()? signedIn,
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
    required TResult Function(_SignedIn value) signedIn,
  }) {
    return filling(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Filling value)? filling,
    TResult? Function(_Error value)? error,
    TResult? Function(_SignedIn value)? signedIn,
  }) {
    return filling?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Filling value)? filling,
    TResult Function(_Error value)? error,
    TResult Function(_SignedIn value)? signedIn,
    required TResult orElse(),
  }) {
    if (filling != null) {
      return filling(this);
    }
    return orElse();
  }
}

abstract class _Filling implements SignInState {
  const factory _Filling() = _$FillingImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Set<SignInError> errors});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$ErrorImpl>
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
              as Set<SignInError>,
    ));
  }
}

/// @nodoc

class _$ErrorImpl with DiagnosticableTreeMixin implements _Error {
  const _$ErrorImpl({required final Set<SignInError> errors})
      : _errors = errors;

  final Set<SignInError> _errors;
  @override
  Set<SignInError> get errors {
    if (_errors is EqualUnmodifiableSetView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_errors);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInState.error(errors: $errors)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInState.error'))
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
    required TResult Function(Set<SignInError> errors) error,
    required TResult Function() signedIn,
  }) {
    return error(errors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? filling,
    TResult? Function(Set<SignInError> errors)? error,
    TResult? Function()? signedIn,
  }) {
    return error?.call(errors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? filling,
    TResult Function(Set<SignInError> errors)? error,
    TResult Function()? signedIn,
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
    required TResult Function(_SignedIn value) signedIn,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Filling value)? filling,
    TResult? Function(_Error value)? error,
    TResult? Function(_SignedIn value)? signedIn,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Filling value)? filling,
    TResult Function(_Error value)? error,
    TResult Function(_SignedIn value)? signedIn,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements SignInState {
  const factory _Error({required final Set<SignInError> errors}) = _$ErrorImpl;

  Set<SignInError> get errors;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignedInImplCopyWith<$Res> {
  factory _$$SignedInImplCopyWith(
          _$SignedInImpl value, $Res Function(_$SignedInImpl) then) =
      __$$SignedInImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignedInImplCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$SignedInImpl>
    implements _$$SignedInImplCopyWith<$Res> {
  __$$SignedInImplCopyWithImpl(
      _$SignedInImpl _value, $Res Function(_$SignedInImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignedInImpl with DiagnosticableTreeMixin implements _SignedIn {
  const _$SignedInImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInState.signedIn()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SignInState.signedIn'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignedInImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() filling,
    required TResult Function(Set<SignInError> errors) error,
    required TResult Function() signedIn,
  }) {
    return signedIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? filling,
    TResult? Function(Set<SignInError> errors)? error,
    TResult? Function()? signedIn,
  }) {
    return signedIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? filling,
    TResult Function(Set<SignInError> errors)? error,
    TResult Function()? signedIn,
    required TResult orElse(),
  }) {
    if (signedIn != null) {
      return signedIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Filling value) filling,
    required TResult Function(_Error value) error,
    required TResult Function(_SignedIn value) signedIn,
  }) {
    return signedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Filling value)? filling,
    TResult? Function(_Error value)? error,
    TResult? Function(_SignedIn value)? signedIn,
  }) {
    return signedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Filling value)? filling,
    TResult Function(_Error value)? error,
    TResult Function(_SignedIn value)? signedIn,
    required TResult orElse(),
  }) {
    if (signedIn != null) {
      return signedIn(this);
    }
    return orElse();
  }
}

abstract class _SignedIn implements SignInState {
  const factory _SignedIn() = _$SignedInImpl;
}
