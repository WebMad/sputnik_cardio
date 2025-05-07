import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:intl/intl.dart';
import 'package:sputnik_cardio/src/features/maps/widgets/track_layer.dart';
import 'package:sputnik_cardio/src/features/tracking/models/extended_pos.dart';
import 'package:sputnik_cardio/src/features/tracking/models/pos.dart';
import 'package:sputnik_cardio/src/features/workout_recording/workout_info_screen_deps_node.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';

class WorkoutInfoScreen extends StatefulWidget {
  const WorkoutInfoScreen({
    super.key,
  });

  @override
  State<WorkoutInfoScreen> createState() => _WorkoutInfoScreenState();
}

class _WorkoutInfoScreenState extends State<WorkoutInfoScreen> {
  late final WorkoutInfoScreenDepsNode _workoutScreenDepsNode;
  late final MapController flutterMapController;

  bool _isReady = false;

  @override
  void initState() {
    super.initState();

    _workoutScreenDepsNode =
        context.depsNode<WorkoutInfoScreenDepsNode>(listen: false);

    if (_workoutScreenDepsNode.status == DepsNodeStatus.idle) {
      _workoutScreenDepsNode.init();
    }

    flutterMapController = MapController();
  }

  void _centerMap() {
    final detailedWorkout =
        _workoutScreenDepsNode.workoutScreenStateHolder().state;

    final coords = detailedWorkout.routes.values
        .fold(
          <ExtendedPos>[],
          (previousValue, element) => previousValue..addAll(element),
        )
        .map((e) => e.latLng)
        .toList();

    if (coords.isNotEmpty && _isReady) {
      flutterMapController.fitCamera(
        CameraFit.coordinates(
          coordinates: coords,
          padding: const EdgeInsets.all(30),
        ),
      );
    }
  }

  void _dispose() async {
    await _workoutScreenDepsNode.dispose();
    _workoutScreenDepsNode.clear();
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SpukiScaffold(
      appBar: AppBar(
        title: const SpukiText.h3('Тренировка'),
      ),
      body: SafeArea(
        child: DepsNodeBuilder(
          depsNode: _workoutScreenDepsNode,
          initialized: (context, workoutScreenDepsNode) {
            final detailedWorkout =
                _workoutScreenDepsNode.workoutScreenStateHolder().state;

            final workout = detailedWorkout.workout;

            final startAt = workout.startAt;

            _centerMap();

            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SpukiText(
                    'Дата: ${DateFormat('HH:mm dd.MM.yyyy').format(startAt)}',
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            SpukiText('Расстояние'),
                            // SpukiText(
                            //   '${widget.workoutSummary.metrics.kms.toStringAsFixed(2)} km',
                            // ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            SpukiText('Средняя скорость'),
                            // SpukiText(
                            //   '${widget.workoutSummary.metrics.avgSpeed.toStringAsFixed(2)} km/h',
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 400,
                    child: FlutterMap(
                      mapController: flutterMapController,
                      options: MapOptions(
                        onMapReady: () {
                          _isReady = true;
                          _centerMap();
                        },
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          // tileProvider: CancellableNetworkTileProvider(),
                          // tileUpdateTransformer: _animatedMoveTileUpdateTransformer,
                        ),
                        for (final segment in workout.segments)
                          TrackLayer(
                            trackProvider: workoutScreenDepsNode
                                .workoutTrackProvider(segment.routeUuid),
                            segmentType: segment.type,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          orElse: (context, depsNode) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
