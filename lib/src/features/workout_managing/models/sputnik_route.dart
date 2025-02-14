import '../../tracking/models/extended_pos.dart';

class SputnikRoute {
  final String uuid;
  final List<ExtendedPos> _coords;

  SputnikRoute(
    this.uuid,
    this._coords,
  );

  List<ExtendedPos> get coords => List.unmodifiable(_coords);

  void push(ExtendedPos pos) {
    coords.add(pos);
  }
}
