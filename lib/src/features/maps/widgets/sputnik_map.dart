import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:latlong2/latlong.dart';
import 'package:sputnik_cardio/src/features/maps/maps_deps_node.dart';
import 'package:sputnik_cardio/src/features/maps/widgets/track_layer.dart';
import 'package:sputnik_cardio/src/features/workout_recording/state_holders/workout_state_holder.dart';
import 'package:sputnik_cardio/src/features/workout_recording/workout_deps_node.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';

import '../../tracking/models/pos.dart';
import '../../workout_core/models/workout.dart';
import '../providers/cached_network_tile_provider.dart';
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

    final workoutDepsNode = context.depsNode<WorkoutDepsNode>(listen: true);

    final workoutStateHolder = workoutDepsNode.workoutStateHolder();

    return Stack(
      children: [
        StreamBuilder<Workout?>(
          initialData: workoutStateHolder.state,
          stream: workoutStateHolder.stream,
          builder: (context, snapshot) {
            final workout = snapshot.data;
            return FlutterMap(
              options: MapOptions(
                onMapReady: () {
                  isReady = true;
                },
                onPositionChanged: (camera, hasGesture) {
                  if (hasGesture) {
                    mapsDepsNode.mapsCenteringManager().onUserInteract();
                  }
                },
                // onPointerDown: (event, point) {},
              ),
              mapController: flutterMapController,
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',

                  /// todo: изменить на мой id
                  userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                  // tileProvider: CancellableNetworkTileProvider(),
                  // tileUpdateTransformer: _animatedMoveTileUpdateTransformer,
                  tileProvider: CachedNetworkTileProvider(
                    cacheManager: DefaultCacheManager(),
                  ),
                ),
                if (workout != null) ...[
                  for (final segment in workout.segments)
                    TrackLayer(
                      trackProvider: workoutDepsNode
                          .workoutTrackDepsNode()
                          .trackProvider(segment.routeUuid),
                      segmentType: segment.type,
                    ),
                ],
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
