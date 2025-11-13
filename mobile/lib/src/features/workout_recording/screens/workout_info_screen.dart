import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:sputnik_cardio/src/features/maps/widgets/track_layer.dart';
import 'package:sputnik_cardio/src/features/workout_recording/workout_info_screen_deps_node.dart';
import 'package:sputnik_location/sputnik_location.dart';
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

    final coords = detailedWorkout.workout.segments
        .map((segment) => detailedWorkout.routes[segment.routeUuid] ?? [])
        .fold(
          <ExtendedPos>[],
          (previousValue, element) => previousValue..addAll(element),
        )
        .map((e) => e.latLng)
        .toList();

    if (coords.isNotEmpty && _isReady) {
      final bounds = LatLngBounds.fromPoints(coords);
      flutterMapController.fitCamera(
        CameraFit.bounds(
          bounds: bounds,
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
            final metrics = detailedWorkout.metrics;

            final workout = detailedWorkout.workout;

            final startAt = workout.startAt;

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
                  if (metrics != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  const SpukiText('Длительность'),
                                  SpukiText(
                                    _formatTime(metrics.duration),
                                    spukiFontType: SpukiFontType.h3,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const SpukiText('Темп'),
                                  SpukiText(
                                    _formatTime(metrics.pace),
                                    spukiFontType: SpukiFontType.h3,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  const SpukiText('Расстояние'),
                                  SpukiText(
                                    '${metrics.kms.toStringAsFixed(2)} км',
                                    spukiFontType: SpukiFontType.h3,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const SpukiText('Ср. скорость'),
                                  SpukiText(
                                    '${metrics.avgSpeed.toStringAsFixed(2)} км/ч',
                                    spukiFontType: SpukiFontType.h3,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 400,
                    child: FlutterMap(
                      mapController: flutterMapController,
                      options: MapOptions(
                        onMapReady: () {
                          _isReady = true;
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            _centerMap();
                          });
                        },
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName:
                              'dev.fleaflet.flutter_map.example',
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

  String _formatTime(Duration duration) {
    final totalSeconds = duration.inSeconds;
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    final seconds = totalSeconds % 60;

    final hoursStr = hours > 0 ? '${hours.toString().padLeft(2, '0')}:' : '';
    final minutesStr = minutes.toString().padLeft(2, '0');
    final secondsStr = seconds.toString().padLeft(2, '0');

    return '$hoursStr$minutesStr:$secondsStr';
  }
}
