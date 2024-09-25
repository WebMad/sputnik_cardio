import '../models/pos.dart';

abstract class LocationManager {
  static const moscowPosition = Pos(lat: 55.751244, lon: 37.618423);

  Future<bool> get checkPermissions;

  Future<Pos> get location;

  Stream<Pos> get locationStream;
}
