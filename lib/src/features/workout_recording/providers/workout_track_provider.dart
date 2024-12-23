import 'dart:async';

import 'package:sputnik_cardio/src/features/tracking/models/extended_pos.dart';
import 'package:sputnik_cardio/src/features/tracking/models/pos.dart';

import '../../maps/providers/track_provider.dart';

class WorkoutTrackProvider extends TrackProvider {
  final _track = <ExtendedPos>[];
  final _controller = StreamController<ExtendedPos>.broadcast();

  void pushAll(List<ExtendedPos> coords) {
    _track.addAll(coords);
    if (coords.isNotEmpty) {
      _controller.add(coords.last);
    }
  }

  void push(ExtendedPos pos) {
    _track.add(pos);
    _controller.add(pos);
  }

  void clear() {
    _track.clear();
  }

  @override
  List<ExtendedPos> get track => _track;

  @override
  Stream<ExtendedPos> get trackStream => _controller.stream;
}
