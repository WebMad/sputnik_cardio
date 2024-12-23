import '../../tracking/models/pos.dart';

abstract class TrackProvider {
  List<Pos> get track;

  Stream<Pos> get trackStream;
}