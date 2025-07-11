import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:sputnik_cardio/src/features/tracking/tracking_deps_node.dart';
import 'package:sputnik_location/sputnik_location.dart';

class CurrentLocationLayer extends StatelessWidget {
  final double size;
  final Color color;
  final Color borderColor;

  const CurrentLocationLayer({
    super.key,
    required this.size,
    this.color = Colors.lightBlue,
    this.borderColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final locationDataMarker =
        context.depsNode<LocationDepsNode>().locationDataMarker();

    return StreamBuilder<ExtendedPos>(
      initialData: locationDataMarker.location,
      stream: locationDataMarker.locationStream,
      builder: (context, snapshot) {
        final pos = snapshot.data;
        return MarkerLayer(
          markers: [
            if (pos != null)
              Marker(
                width: size,
                height: size,
                point: pos.latLng,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: .2,
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  width: size,
                  height: size,
                  child: Center(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: borderColor,
                      ),
                      child: SizedBox(
                        width: size * .6,
                        height: size * .6,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

abstract class LocationDataMarker {
  ExtendedPos? get location;

  Stream<ExtendedPos> get locationStream;
}
