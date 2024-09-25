import 'tracking_holder.dart';
import 'tracking_model.dart';

class TrackingPresenter {
  final TrackingHolder _trackingHolder;

  TrackingPresenter(this._trackingHolder);

  void start() {
    if (!_trackingHolder.isInitial) {
      return;
    }

    _trackingHolder.update(const TrackingModel.played());
  }

  void resume() {
    if (!_trackingHolder.isPaused) {
      return;
    }

    _trackingHolder.update(const TrackingModel.played());
  }

  void pause() {
    if (!_trackingHolder.isPlayed) {
      return;
    }

    _trackingHolder.update(const TrackingModel.paused());
  }

  void stop() {
    if (!_trackingHolder.isPlayedOrPaused) {
      return;
    }

    _trackingHolder.update(const TrackingModel.stopped());
  }

  void reset() {
    _trackingHolder.update(const TrackingModel.initial());
  }
}
