import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'foreground_task_input.freezed.dart';

part 'foreground_task_input.g.dart';

@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
class ForegroundTaskInput with _$ForegroundTaskInput {
  @JsonSerializable(explicitToJson: true)
  const factory ForegroundTaskInput.location() = _ForegroundTaskInput;

  factory ForegroundTaskInput.fromJson(Map<String, dynamic> json) =>
      _$ForegroundTaskInputFromJson(json);
}
