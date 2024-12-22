import 'package:sputnik_cardio/src/features/workout_recording/managers/workout_lifecycle_manager.dart';

import 'tracking_holder.dart';
import 'tracking_model.dart';

class TrackingPresenter {
  final TrackingHolder _trackingHolder;
  final WorkoutLifecycleManager _workoutLifecycleManager;

  TrackingPresenter(
    this._trackingHolder,
    this._workoutLifecycleManager,
  );

  void start() {
    if (!_trackingHolder.isInitial) {
      return;
    }

    _workoutLifecycleManager.start();
  }

  void resume() {
    if (!_trackingHolder.isPaused) {
      return;
    }

    // _trackingHolder.update(const TrackingModel.played());
  }

  void pause() {
    if (!_trackingHolder.isPlayed) {
      return;
    }

    // _trackingHolder.update(const TrackingModel.paused());
  }

  void stop() {
    if (!_trackingHolder.isPlayedOrPaused) {
      return;
    }

    _workoutLifecycleManager.stop();
  }

  void reset() {
    _trackingHolder.update(const TrackingModel.initial());
  }
}
