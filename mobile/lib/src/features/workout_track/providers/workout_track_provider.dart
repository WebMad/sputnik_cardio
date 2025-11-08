import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:sputnik_location/sputnik_location.dart';

import '../../maps/providers/track_provider.dart';

class WorkoutTrackProvider extends ChangeNotifier implements TrackProvider {
  final _track = <ExtendedPos>[];
  final _controller = StreamController<ExtendedPos>.broadcast();

  void pushAll(List<ExtendedPos> coords) {
    _track.addAll(coords);
    if (coords.isNotEmpty) {
      _controller.add(coords.last);
    }
    notifyListeners();
  }

  void push(ExtendedPos pos) {
    _track.add(pos);
    _controller.add(pos);
    notifyListeners();
  }

  void clear() {
    _track.clear();
    notifyListeners();
  }

  @override
  List<ExtendedPos> get track => _track;

  @override
  Stream<ExtendedPos> get trackStream => _controller.stream;
}
