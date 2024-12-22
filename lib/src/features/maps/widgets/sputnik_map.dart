import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:latlong2/latlong.dart';
import 'package:sputnik_cardio/src/features/maps/maps_deps_node.dart';

import '../../tracking/models/pos.dart';
import 'current_location_layer.dart';

class SputnikMap extends StatefulWidget {
  const SputnikMap({super.key});

  @override
  State<SputnikMap> createState() => _SputnikMapState();
}

class _SputnikMapState extends State<SputnikMap> {
  late final MapController flutterMapController;

  bool isReady = false;

  StreamSubscription<Pos>? _centerPosSub;

  @override
  void initState() {
    super.initState();

    flutterMapController = MapController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initCenterPosSub();
  }

  Future<void> _initCenterPosSub() async {
    await _centerPosSub?.cancel();
    _centerPosSub = null;

    _centerPosSub = DepsNodeBinder.of<MapsDepsNode>(context)
        .mapCenterStateHolder
        .stream
        .listen((center) {
      if (isReady && mounted) {
        flutterMapController.move(
          LatLng(center.lat, center.lon),
          15,
        );
      }
    });
  }

  @override
  void dispose() {
    _centerPosSub?.cancel();
    _centerPosSub = null;
    flutterMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        onMapReady: () {
          isReady = true;
        },
      ),
      mapController: flutterMapController,
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',

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
