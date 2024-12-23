import '../../tracking/models/extended_pos.dart';

class KmMetricCalculator {
  double calc(List<ExtendedPos> coords) {
    if (coords.isEmpty || coords.length == 1) return 0;

    double kms = 0;
    for (int i = 1; i < coords.length; i++) {
      kms += coords[i - 1].distanceTo(coords[i]);
    }

    return kms;
  }
}
