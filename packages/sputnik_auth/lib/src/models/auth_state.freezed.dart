// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function() unauthorized,
    required TResult Function(User user) authorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function()? unauthorized,
    TResult? Function(User user)? authorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function()? unauthorized,
    TResult Function(User user)? authorized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoneAuthState value) none,
    required TResult Function(UnauthorizedAuthState value) unauthorized,
    required TResult Function(AuthorizedAuthState value) authorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NoneAuthState value)? none,
    TResult? Function(UnauthorizedAuthState value)? unauthorized,
    TResult? Function(AuthorizedAuthState value)? authorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoneAuthState value)? none,
    TResult Function(UnauthorizedAuthState value)? unauthorized,
    TResult Function(AuthorizedAuthState value)? authorized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NoneAuthStateImplCopyWith<$Res> {
  factory _$$NoneAuthStateImplCopyWith(
          _$NoneAuthStateImpl value, $Res Function(_$NoneAuthStateImpl) then) =
      __$$NoneAuthStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoneAuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$NoneAuthStateImpl>
    implements _$$NoneAuthStateImplCopyWith<$Res> {
  __$$NoneAuthStateImplCopyWithImpl(
      _$NoneAuthStateImpl _value, $Res Function(_$NoneAuthStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoneAuthStateImpl
    with DiagnosticableTreeMixin
    implements NoneAuthState {
  const _$NoneAuthStateImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.none()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthState.none'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoneAuthStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function() unauthorized,
    required TResult Function(User user) authorized,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function()? unauthorized,
    TResult? Function(User user)? authorized,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function()? unauthorized,
    TResult Function(User user)? authorized,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoneAuthState value) none,
    required TResult Function(UnauthorizedAuthState value) unauthorized,
    required TResult Function(AuthorizedAuthState value) authorized,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NoneAuthState value)? none,
    TResult? Function(UnauthorizedAuthState value)? unauthorized,
    TResult? Function(AuthorizedAuthState value)? authorized,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoneAuthState value)? none,
    TResult Function(UnauthorizedAuthState value)? unauthorized,
    TResult Function(AuthorizedAuthState value)? authorized,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class NoneAuthState implements AuthState {
  const factory NoneAuthState() = _$NoneAuthStateImpl;
}

/// @nodoc
abstract class _$$UnauthorizedAuthStateImplCopyWith<$Res> {
  factory _$$UnauthorizedAuthStateImplCopyWith(
          _$UnauthorizedAuthStateImpl value,
          $Res Function(_$UnauthorizedAuthStateImpl) then) =
      __$$UnauthorizedAuthStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthorizedAuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$UnauthorizedAuthStateImpl>
    implements _$$UnauthorizedAuthStateImplCopyWith<$Res> {
  __$$UnauthorizedAuthStateImplCopyWithImpl(_$UnauthorizedAuthStateImpl _value,
      $Res Function(_$UnauthorizedAuthStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnauthorizedAuthStateImpl
    with DiagnosticableTreeMixin
    implements UnauthorizedAuthState {
  const _$UnauthorizedAuthStateImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.unauthorized()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthState.unauthorized'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthorizedAuthStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function() unauthorized,
    required TResult Function(User user) authorized,
  }) {
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function()? unauthorized,
    TResult? Function(User user)? authorized,
  }) {
    return unauthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function()? unauthorized,
    TResult Function(User user)? authorized,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoneAuthState value) none,
    required TResult Function(UnauthorizedAuthState value) unauthorized,
    required TResult Function(AuthorizedAuthState value) authorized,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NoneAuthState value)? none,
    TResult? Function(UnauthorizedAuthState value)? unauthorized,
    TResult? Function(AuthorizedAuthState value)? authorized,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoneAuthState value)? none,
    TResult Function(UnauthorizedAuthState value)? unauthorized,
    TResult Function(AuthorizedAuthState value)? authorized,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class UnauthorizedAuthState implements AuthState {
  const factory UnauthorizedAuthState() = _$UnauthorizedAuthStateImpl;
}

/// @nodoc
abstract class _$$AuthorizedAuthStateImplCopyWith<$Res> {
  factory _$$AuthorizedAuthStateImplCopyWith(_$AuthorizedAuthStateImpl value,
          $Res Function(_$AuthorizedAuthStateImpl) then) =
      __$$AuthorizedAuthStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthorizedAuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthorizedAuthStateImpl>
    implements _$$AuthorizedAuthStateImplCopyWith<$Res> {
  __$$AuthorizedAuthStateImplCopyWithImpl(_$AuthorizedAuthStateImpl _value,
      $Res Function(_$AuthorizedAuthStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$AuthorizedAuthStateImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$AuthorizedAuthStateImpl
    with DiagnosticableTreeMixin
    implements AuthorizedAuthState {
  const _$AuthorizedAuthStateImpl({required this.user});

  @override
  final User user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.authorized(user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.authorized'))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorizedAuthStateImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorizedAuthStateImplCopyWith<_$AuthorizedAuthStateImpl> get copyWith =>
      __$$AuthorizedAuthStateImplCopyWithImpl<_$AuthorizedAuthStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function() unauthorized,
    required TResult Function(User user) authorized,
  }) {
    return authorized(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function()? unauthorized,
    TResult? Function(User user)? authorized,
  }) {
    return authorized?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function()? unauthorized,
    TResult Function(User user)? authorized,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoneAuthState value) none,
    required TResult Function(UnauthorizedAuthState value) unauthorized,
    required TResult Function(AuthorizedAuthState value) authorized,
  }) {
    return authorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NoneAuthState value)? none,
    TResult? Function(UnauthorizedAuthState value)? unauthorized,
    TResult? Function(AuthorizedAuthState value)? authorized,
  }) {
    return authorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoneAuthState value)? none,
    TResult Function(UnauthorizedAuthState value)? unauthorized,
    TResult Function(AuthorizedAuthState value)? authorized,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(this);
    }
    return orElse();
  }
}

abstract class AuthorizedAuthState implements AuthState {
  const factory AuthorizedAuthState({required final User user}) =
      _$AuthorizedAuthStateImpl;

  User get user;
  @JsonKey(ignore: true)
  _$$AuthorizedAuthStateImplCopyWith<_$AuthorizedAuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
