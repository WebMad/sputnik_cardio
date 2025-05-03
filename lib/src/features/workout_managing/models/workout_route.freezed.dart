// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkoutRoute _$WorkoutRouteFromJson(Map<String, dynamic> json) {
  return _WorkoutRoute.fromJson(json);
}

/// @nodoc
mixin _$WorkoutRoute {
  String get uuid => throw _privateConstructorUsedError;
  List<ExtendedPos> get poses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkoutRouteCopyWith<WorkoutRoute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutRouteCopyWith<$Res> {
  factory $WorkoutRouteCopyWith(
          WorkoutRoute value, $Res Function(WorkoutRoute) then) =
      _$WorkoutRouteCopyWithImpl<$Res, WorkoutRoute>;
  @useResult
  $Res call({String uuid, List<ExtendedPos> poses});
}

/// @nodoc
class _$WorkoutRouteCopyWithImpl<$Res, $Val extends WorkoutRoute>
    implements $WorkoutRouteCopyWith<$Res> {
  _$WorkoutRouteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? poses = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      poses: null == poses
          ? _value.poses
          : poses // ignore: cast_nullable_to_non_nullable
              as List<ExtendedPos>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutRouteImplCopyWith<$Res>
    implements $WorkoutRouteCopyWith<$Res> {
  factory _$$WorkoutRouteImplCopyWith(
          _$WorkoutRouteImpl value, $Res Function(_$WorkoutRouteImpl) then) =
      __$$WorkoutRouteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid, List<ExtendedPos> poses});
}

/// @nodoc
class __$$WorkoutRouteImplCopyWithImpl<$Res>
    extends _$WorkoutRouteCopyWithImpl<$Res, _$WorkoutRouteImpl>
    implements _$$WorkoutRouteImplCopyWith<$Res> {
  __$$WorkoutRouteImplCopyWithImpl(
      _$WorkoutRouteImpl _value, $Res Function(_$WorkoutRouteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? poses = null,
  }) {
    return _then(_$WorkoutRouteImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      poses: null == poses
          ? _value._poses
          : poses // ignore: cast_nullable_to_non_nullable
              as List<ExtendedPos>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutRouteImpl with DiagnosticableTreeMixin implements _WorkoutRoute {
  const _$WorkoutRouteImpl(
      {required this.uuid, required final List<ExtendedPos> poses})
      : _poses = poses;

  factory _$WorkoutRouteImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutRouteImplFromJson(json);

  @override
  final String uuid;
  final List<ExtendedPos> _poses;
  @override
  List<ExtendedPos> get poses {
    if (_poses is EqualUnmodifiableListView) return _poses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_poses);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WorkoutRoute(uuid: $uuid, poses: $poses)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WorkoutRoute'))
      ..add(DiagnosticsProperty('uuid', uuid))
      ..add(DiagnosticsProperty('poses', poses));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutRouteImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            const DeepCollectionEquality().equals(other._poses, _poses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, uuid, const DeepCollectionEquality().hash(_poses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutRouteImplCopyWith<_$WorkoutRouteImpl> get copyWith =>
      __$$WorkoutRouteImplCopyWithImpl<_$WorkoutRouteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutRouteImplToJson(
      this,
    );
  }
}

abstract class _WorkoutRoute implements WorkoutRoute {
  const factory _WorkoutRoute(
      {required final String uuid,
      required final List<ExtendedPos> poses}) = _$WorkoutRouteImpl;

  factory _WorkoutRoute.fromJson(Map<String, dynamic> json) =
      _$WorkoutRouteImpl.fromJson;

  @override
  String get uuid;
  @override
  List<ExtendedPos> get poses;
  @override
  @JsonKey(ignore: true)
  _$$WorkoutRouteImplCopyWith<_$WorkoutRouteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
