import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String uuid,
    required String email,
  }) = _User;

  const factory User.guest() = _Guest;
}