import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/tracking/models/extended_pos.dart';

abstract class RealtimeMetricCalculator<T extends RealtimeMetric>
    implements Lifecycle {
  StreamController<T>? _streamController;

  T _metric;

  RealtimeMetricCalculator(this._metric);

  void handlePos(ExtendedPos pos);

  Stream<T> get metricStream => _streamController!.stream;

  T get metric => _metric;

  void update(T newMetric) {
    _metric = newMetric;
    _streamController!.add(newMetric);
  }

  @override
  Future<void> init() async {
    _streamController = StreamController<T>.broadcast();
  }

  @override
  Future<void> dispose() async {
    await _streamController?.close();
    _streamController = null;
  }
}

abstract interface class RealtimeMetric {
  String toView(BuildContext context);
}
