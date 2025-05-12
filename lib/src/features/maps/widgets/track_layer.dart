import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:sputnik_cardio/src/features/maps/providers/track_provider.dart';
import 'package:sputnik_cardio/src/features/tracking/models/pos.dart';
import 'package:sputnik_cardio/src/features/workout_core/workout_core.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';

class TrackLayer extends StatefulWidget {
  final WorkoutSegmentType segmentType;
  final TrackProvider trackProvider;

  const TrackLayer({
    super.key,
    required this.trackProvider,
    required this.segmentType,
  });

  @override
  State<TrackLayer> createState() => _TrackLayerState();
}

class _TrackLayerState extends State<TrackLayer> {
  @override
  Widget build(BuildContext context) {
    final theme = SpukiTheme.of(context);

    return StreamBuilder<Pos>(
      stream: widget.trackProvider.trackStream,
      builder: (context, snapshot) {
        return PolylineLayer(
          polylines: [
            Polyline(
              pattern: widget.segmentType == WorkoutSegmentType.pause
                  ? const StrokePattern.dotted()
                  : const StrokePattern.solid(),
              color: widget.segmentType == WorkoutSegmentType.pause
                  ? Colors.grey
                  : Colors.orange,
              strokeWidth: theme.puk(2),
              points: widget.trackProvider.track.map((e) => e.latLng).toList(),
            ),
          ],
        );
      },
    );
  }
}
