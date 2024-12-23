import '../../tracking/models/extended_pos.dart';

class AvgSpeedCalculator {
  double calc(List<ExtendedPos> coords) {
    if (coords.isEmpty || coords.length == 1) return 0;

    double kms = 0;
    for (int i = 1; i < coords.length; i++) {
      kms += coords[i - 1].distanceTo(coords[i]);
    }

    double time = coords[coords.length - 1]
            .fetchedAt
            .difference(coords[0].fetchedAt)
            .inSeconds /
        (60 * 60);

    if (time == 0) return 0;

    return kms / time;
  }
}
