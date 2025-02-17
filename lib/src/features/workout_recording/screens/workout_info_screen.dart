import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:intl/intl.dart';
import 'package:sputnik_cardio/src/features/maps/widgets/track_layer.dart';
import 'package:sputnik_cardio/src/features/tracking/models/pos.dart';
import 'package:sputnik_cardio/src/features/workout_recording/workout_info_screen_deps_node.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';

class WorkoutInfoScreen extends StatefulWidget {
  // final WorkoutSummary workoutSummary;
  // final WorkoutLifecycleDepsNode workoutLifecycleDepsNode;

  const WorkoutInfoScreen({
    super.key,
    // required this.workoutSummary,
    // required this.workoutLifecycleDepsNode,
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

    _workoutScreenDepsNode.init();

    flutterMapController = MapController();
  }

  void _centerMap() {
    final track = _workoutScreenDepsNode.workoutTrackProvider().track;

    if (track.isNotEmpty && _isReady) {
      flutterMapController.fitCamera(
        CameraFit.coordinates(
          coordinates: track
              .map(
                (e) => e.latLng,
              )
              .toList(),
          padding: const EdgeInsets.all(30),
        ),
      );
    }
  }

  @override
  void dispose() {
    _workoutScreenDepsNode.dispose();
    _workoutScreenDepsNode.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final startAt = widget.workoutSummary.workout.startAt;

    return SpukiScaffold(
      appBar: AppBar(
        title: const SpukiText.h3('Тренировка'),
      ),
      body: SafeArea(
        child: DepsNodeBuilder(
          depsNode: _workoutScreenDepsNode,
          initialized: (context, workoutScreenDepsNode) {
            final workoutTrackProvider =
                _workoutScreenDepsNode.workoutTrackProvider();
            return ListenableBuilder(
                listenable: workoutTrackProvider,
                builder: (context, child) {
                  _centerMap();

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // if (startAt != null)
                        //   SpukiText(
                        //     'Дата: ${DateFormat('HH:MM dd.MM.yyyy').format(startAt)}',
                        //   ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                children: [
                                  const SpukiText('Расстояние'),
                                  // SpukiText(
                                  //   '${widget.workoutSummary.metrics.kms.toStringAsFixed(2)} km',
                                  // ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                children: [
                                  const SpukiText('Средняя скорость'),
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
                              TrackLayer(
                                trackProvider: _workoutScreenDepsNode
                                    .workoutTrackProvider(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                });
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
