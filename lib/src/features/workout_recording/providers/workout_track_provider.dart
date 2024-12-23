import 'dart:async';

import 'package:sputnik_cardio/src/features/tracking/models/pos.dart';

import '../../maps/providers/track_provider.dart';

class WorkoutTrackProvider extends TrackProvider {
  final _track = <Pos>[];
  final _controller = StreamController<Pos>.broadcast();

  void push(Pos pos) {
    _track.add(pos);
    _controller.add(pos);
  }

  void clear() {
    _track.clear();
  }

  @override
  List<Pos> get track => _track;

  @override
  Stream<Pos> get trackStream => _controller.stream;
}
