import 'package:sputnik_cardio/src/features/tracking/models/extended_pos.dart';

import '../../tracking/models/pos.dart';

abstract class TrackProvider {
  List<ExtendedPos> get track;

  Stream<ExtendedPos> get trackStream;
}