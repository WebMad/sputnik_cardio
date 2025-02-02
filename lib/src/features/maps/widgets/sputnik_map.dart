import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:latlong2/latlong.dart';
import 'package:sputnik_cardio/src/features/maps/maps_deps_node.dart';
import 'package:sputnik_cardio/src/features/maps/widgets/track_layer.dart';
import 'package:sputnik_cardio/src/features/tracking/presentation/presenters/tracking_presenter/tracking_holder.dart';
import 'package:sputnik_cardio/src/features/tracking/tracking_deps_node.dart';
import 'package:sputnik_cardio/src/features/workout_recording/providers/workout_track_provider.dart';
import 'package:sputnik_cardio/src/features/workout_recording/workout_lifecycle_deps_node.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';

import '../../tracking/models/pos.dart';
import '../../tracking/presentation/presenters/tracking_presenter/tracking_model.dart';
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
        .mapCenterStateHolder()
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
    final theme = SpukiTheme.of(context);

    final mapsDepsNode = DepsNodeBinder.of<MapsDepsNode>(context);

    final workoutLifecycleDepsNode =
        DepsNodeBinder.of<WorkoutLifecycleDepsNode>(context);

    final trackingHolder =
        DepsNodeBinder.of<TrackingDataDepsNode>(context).trackingHolder();

    return Stack(
      children: [
        StreamBuilder<TrackingModel>(
          initialData: trackingHolder.state,
          stream: trackingHolder.stream,
          builder: (context, snapshot) {
            return FlutterMap(
              options: MapOptions(
                onMapReady: () {
                  isReady = true;
                },
                onPointerDown: (event, point) {
                  mapsDepsNode.mapsCenteringManager().onUserInteract();
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
                if (trackingHolder.isPlayedOrPaused)
                  TrackLayer(
                    trackProvider:
                        workoutLifecycleDepsNode.workoutTrackProvider(),
                  ),
                const CurrentLocationLayer(size: 12),
              ],
            );
          },
        ),
        Positioned(
          bottom: 30,
          right: 10,
          child: GestureDetector(
            onTap: () {
              mapsDepsNode.mapsCenteringManager().onUserLocationTap();
            },
            child: Container(
              padding: EdgeInsets.all(theme.puk(2)),
              decoration: const BoxDecoration(
                color: Colors.deepPurpleAccent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.gps_fixed,
                color: Colors.white,
                size: theme.puk(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
