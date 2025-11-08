import 'package:sputnik_location/sputnik_location.dart';

abstract class TrackProvider {
  List<ExtendedPos> get track;

  Stream<ExtendedPos> get trackStream;
}
