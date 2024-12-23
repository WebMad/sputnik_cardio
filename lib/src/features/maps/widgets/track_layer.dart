import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:sputnik_cardio/src/features/maps/providers/track_provider.dart';
import 'package:sputnik_cardio/src/features/tracking/models/pos.dart';
import 'package:sputnik_ui_kit/sputnik_ui_kit.dart';

class TrackLayer extends StatefulWidget {
  final TrackProvider trackProvider;

  const TrackLayer({
    super.key,
    required this.trackProvider,
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
              color: Colors.orange,
              strokeWidth: theme.puk(2),
              points: widget.trackProvider.track.map((e) => e.latLng).toList(),
            ),
          ],
        );
      },
    );
  }
}
