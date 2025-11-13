// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'foreground_task_output.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ForegroundTaskOutput _$ForegroundTaskOutputFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'location':
      return _Location.fromJson(json);
    case 'location_stream':
      return _LocationStream.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'type', 'ForegroundTaskOutput',
          'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$ForegroundTaskOutput {
  ExtendedPos get pos => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ExtendedPos pos) location,
    required TResult Function(ExtendedPos pos) locationStream,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ExtendedPos pos)? location,
    TResult? Function(ExtendedPos pos)? locationStream,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ExtendedPos pos)? location,
    TResult Function(ExtendedPos pos)? locationStream,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Location value) location,
    required TResult Function(_LocationStream value) locationStream,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Location value)? location,
    TResult? Function(_LocationStream value)? locationStream,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Location value)? location,
    TResult Function(_LocationStream value)? locationStream,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this ForegroundTaskOutput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForegroundTaskOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForegroundTaskOutputCopyWith<ForegroundTaskOutput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForegroundTaskOutputCopyWith<$Res> {
  factory $ForegroundTaskOutputCopyWith(ForegroundTaskOutput value,
          $Res Function(ForegroundTaskOutput) then) =
      _$ForegroundTaskOutputCopyWithImpl<$Res, ForegroundTaskOutput>;
  @useResult
  $Res call({ExtendedPos pos});

  $ExtendedPosCopyWith<$Res> get pos;
}

/// @nodoc
class _$ForegroundTaskOutputCopyWithImpl<$Res,
        $Val extends ForegroundTaskOutput>
    implements $ForegroundTaskOutputCopyWith<$Res> {
  _$ForegroundTaskOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForegroundTaskOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pos = null,
  }) {
    return _then(_value.copyWith(
      pos: null == pos
          ? _value.pos
          : pos // ignore: cast_nullable_to_non_nullable
              as ExtendedPos,
    ) as $Val);
  }

  /// Create a copy of ForegroundTaskOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExtendedPosCopyWith<$Res> get pos {
    return $ExtendedPosCopyWith<$Res>(_value.pos, (value) {
      return _then(_value.copyWith(pos: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LocationImplCopyWith<$Res>
    implements $ForegroundTaskOutputCopyWith<$Res> {
  factory _$$LocationImplCopyWith(
          _$LocationImpl value, $Res Function(_$LocationImpl) then) =
      __$$LocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ExtendedPos pos});

  @override
  $ExtendedPosCopyWith<$Res> get pos;
}

/// @nodoc
class __$$LocationImplCopyWithImpl<$Res>
    extends _$ForegroundTaskOutputCopyWithImpl<$Res, _$LocationImpl>
    implements _$$LocationImplCopyWith<$Res> {
  __$$LocationImplCopyWithImpl(
      _$LocationImpl _value, $Res Function(_$LocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForegroundTaskOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pos = null,
  }) {
    return _then(_$LocationImpl(
      pos: null == pos
          ? _value.pos
          : pos // ignore: cast_nullable_to_non_nullable
              as ExtendedPos,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$LocationImpl with DiagnosticableTreeMixin implements _Location {
  const _$LocationImpl({required this.pos, final String? $type})
      : $type = $type ?? 'location';

  factory _$LocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationImplFromJson(json);

  @override
  final ExtendedPos pos;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ForegroundTaskOutput.location(pos: $pos)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ForegroundTaskOutput.location'))
      ..add(DiagnosticsProperty('pos', pos));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationImpl &&
            (identical(other.pos, pos) || other.pos == pos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pos);

  /// Create a copy of ForegroundTaskOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      __$$LocationImplCopyWithImpl<_$LocationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ExtendedPos pos) location,
    required TResult Function(ExtendedPos pos) locationStream,
  }) {
    return location(pos);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ExtendedPos pos)? location,
    TResult? Function(ExtendedPos pos)? locationStream,
  }) {
    return location?.call(pos);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ExtendedPos pos)? location,
    TResult Function(ExtendedPos pos)? locationStream,
    required TResult orElse(),
  }) {
    if (location != null) {
      return location(pos);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Location value) location,
    required TResult Function(_LocationStream value) locationStream,
  }) {
    return location(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Location value)? location,
    TResult? Function(_LocationStream value)? locationStream,
  }) {
    return location?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Location value)? location,
    TResult Function(_LocationStream value)? locationStream,
    required TResult orElse(),
  }) {
    if (location != null) {
      return location(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationImplToJson(
      this,
    );
  }
}

abstract class _Location implements ForegroundTaskOutput {
  const factory _Location({required final ExtendedPos pos}) = _$LocationImpl;

  factory _Location.fromJson(Map<String, dynamic> json) =
      _$LocationImpl.fromJson;

  @override
  ExtendedPos get pos;

  /// Create a copy of ForegroundTaskOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocationStreamImplCopyWith<$Res>
    implements $ForegroundTaskOutputCopyWith<$Res> {
  factory _$$LocationStreamImplCopyWith(_$LocationStreamImpl value,
          $Res Function(_$LocationStreamImpl) then) =
      __$$LocationStreamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ExtendedPos pos});

  @override
  $ExtendedPosCopyWith<$Res> get pos;
}

/// @nodoc
class __$$LocationStreamImplCopyWithImpl<$Res>
    extends _$ForegroundTaskOutputCopyWithImpl<$Res, _$LocationStreamImpl>
    implements _$$LocationStreamImplCopyWith<$Res> {
  __$$LocationStreamImplCopyWithImpl(
      _$LocationStreamImpl _value, $Res Function(_$LocationStreamImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForegroundTaskOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pos = null,
  }) {
    return _then(_$LocationStreamImpl(
      pos: null == pos
          ? _value.pos
          : pos // ignore: cast_nullable_to_non_nullable
              as ExtendedPos,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$LocationStreamImpl
    with DiagnosticableTreeMixin
    implements _LocationStream {
  const _$LocationStreamImpl({required this.pos, final String? $type})
      : $type = $type ?? 'location_stream';

  factory _$LocationStreamImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationStreamImplFromJson(json);

  @override
  final ExtendedPos pos;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ForegroundTaskOutput.locationStream(pos: $pos)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ForegroundTaskOutput.locationStream'))
      ..add(DiagnosticsProperty('pos', pos));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationStreamImpl &&
            (identical(other.pos, pos) || other.pos == pos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pos);

  /// Create a copy of ForegroundTaskOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationStreamImplCopyWith<_$LocationStreamImpl> get copyWith =>
      __$$LocationStreamImplCopyWithImpl<_$LocationStreamImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ExtendedPos pos) location,
    required TResult Function(ExtendedPos pos) locationStream,
  }) {
    return locationStream(pos);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ExtendedPos pos)? location,
    TResult? Function(ExtendedPos pos)? locationStream,
  }) {
    return locationStream?.call(pos);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ExtendedPos pos)? location,
    TResult Function(ExtendedPos pos)? locationStream,
    required TResult orElse(),
  }) {
    if (locationStream != null) {
      return locationStream(pos);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Location value) location,
    required TResult Function(_LocationStream value) locationStream,
  }) {
    return locationStream(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Location value)? location,
    TResult? Function(_LocationStream value)? locationStream,
  }) {
    return locationStream?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Location value)? location,
    TResult Function(_LocationStream value)? locationStream,
    required TResult orElse(),
  }) {
    if (locationStream != null) {
      return locationStream(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationStreamImplToJson(
      this,
    );
  }
}

abstract class _LocationStream implements ForegroundTaskOutput {
  const factory _LocationStream({required final ExtendedPos pos}) =
      _$LocationStreamImpl;

  factory _LocationStream.fromJson(Map<String, dynamic> json) =
      _$LocationStreamImpl.fromJson;

  @override
  ExtendedPos get pos;

  /// Create a copy of ForegroundTaskOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationStreamImplCopyWith<_$LocationStreamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
