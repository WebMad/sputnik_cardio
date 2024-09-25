import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tracking_model.freezed.dart';

@freezed
class TrackingModel with _$TrackingModel {
  const factory TrackingModel.initial() = _InitialTrackingModel;

  const factory TrackingModel.played() = _PlayedTrackingModel;

  const factory TrackingModel.paused() = _PausedTrackingModel;

  const factory TrackingModel.stopped() = _StoppedTrackingModel;
}
