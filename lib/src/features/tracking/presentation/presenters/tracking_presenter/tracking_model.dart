import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../workout_recording/models/workout.dart';

part 'tracking_model.freezed.dart';

@freezed
class TrackingModel with _$TrackingModel {
  const factory TrackingModel.initial() = _InitialTrackingModel;

  const factory TrackingModel.played({
    required Workout workout,
  }) = _PlayedTrackingModel;

  const factory TrackingModel.paused({
    required Workout workout,
  }) = _PausedTrackingModel;

  const factory TrackingModel.stopped({
    required Workout workout,
  }) = _StoppedTrackingModel;
}

extension TrackingModelEx on TrackingModel {
  Workout get getWorkout => this.map(
    initial: (state) => throw Exception(),
    played: (state) => state.workout,
    paused: (state) => state.workout,
    stopped: (state) => state.workout,
  );
}
