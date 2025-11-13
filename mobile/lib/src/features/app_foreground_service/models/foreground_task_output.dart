import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sputnik_location/sputnik_location.dart';

part 'foreground_task_output.freezed.dart';

part 'foreground_task_output.g.dart';

@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
class ForegroundTaskOutput with _$ForegroundTaskOutput {
  @JsonSerializable(explicitToJson: true)
  const factory ForegroundTaskOutput.location({
    required ExtendedPos pos,
  }) = _Location;

  @JsonSerializable(explicitToJson: true)
  const factory ForegroundTaskOutput.locationStream({
    required ExtendedPos pos,
  }) = _LocationStream;

  factory ForegroundTaskOutput.fromJson(Map<String, dynamic> json) =>
      _$ForegroundTaskOutputFromJson(json);
}
