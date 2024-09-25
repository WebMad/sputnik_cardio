import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'current_location_layer.dart';

class SputnikMap extends StatefulWidget {
  const SputnikMap({super.key});

  @override
  State<SputnikMap> createState() => _SputnikMapState();
}

class _SputnikMapState extends State<SputnikMap> {
  late final MapController flutterMapController;

  @override
  void initState() {
    super.initState();

    flutterMapController = MapController();
  }

  @override
  void dispose() {
    flutterMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: const MapOptions(),
      children: [
        TileLayer(
          urlTemplate:
          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          /// todo: изменить на мой id
          userAgentPackageName: 'dev.fleaflet.flutter_map.example',
          // tileProvider: CancellableNetworkTileProvider(),
          // tileUpdateTransformer: _animatedMoveTileUpdateTransformer,
        ),
        PolylineLayer(
          polylines: [
            Polyline(
              points: [
                const LatLng(30, 40),
                const LatLng(20, 50),
                const LatLng(25, 45),
              ],
              color: Colors.blue,
            ),
          ],
        ),
        const CurrentLocationLayer(size: 12),
      ],
    );
  }
}
