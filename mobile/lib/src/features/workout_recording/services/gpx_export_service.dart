import 'package:sputnik_cardio/src/features/workout_recording/services/gpx_exporter.dart';
import 'package:sputnik_location/sputnik_location.dart';
import '../models/detailed_workout.dart';
import 'dart:math';

class GpxExportService implements GpxExporter {
  @override
  String export(DetailedWorkout workout) {
    final buffer = StringBuffer();
    final singleWorkout = workout.workout;
    final startTime = singleWorkout.startAt;
    final stopTime = singleWorkout.stopAt;
    final workoutUuid = singleWorkout.uuid;
    final workoutName = 'Тренировка ${workoutUuid.substring(0, 8)}';

    buffer.writeln('<?xml version="1.0" encoding="UTF-8"?>');
    buffer.writeln(
        '<gpx version="1.1" creator="SputnikCardio" xmlns="http://www.topografix.com/GPX/1/1">');

    buffer.writeln('  <metadata>');
    buffer.writeln('    <name>${_escapeXml(workoutName)}</name>');
    buffer.writeln('    <time>${_formatDateTime(startTime)}</time>');

    if (stopTime != null) {
      buffer.writeln('    <extensions>');
      buffer.writeln('      <stopTime>${_formatDateTime(stopTime)}</stopTime>');
      buffer.writeln(
          '      <duration>${_calculateDuration(startTime, stopTime)}</duration>');
      buffer.writeln('    </extensions>');
    }

    buffer.writeln('  </metadata>');

    final workoutPoints = _getWorkoutPoints(workout);

    if (workoutPoints.isNotEmpty) {
      _addTrackWithSmartSegments(buffer, workoutName, workoutPoints);
    } else {
      _addEmptyTrack(buffer, workoutName);
    }

    buffer.writeln('</gpx>');
    return buffer.toString();
  }

  List<ExtendedPos> _getWorkoutPoints(DetailedWorkout workout) {
    final allPoints = <ExtendedPos>[];

    for (final segment in workout.workout.segments) {
      final routeUuid = segment.routeUuid;
      final points = workout.routes[routeUuid];

      if (points != null && points.isNotEmpty) {
        final firstPoint = points.first;
        final timeOffset = workout.workout.startAt.difference(firstPoint.fetchedAt);

        final filteredPoints = points.where((point) {
          final correctedTime = point.fetchedAt.add(timeOffset);
          final isInWindow = !correctedTime.isBefore(workout.workout.startAt) &&
              !correctedTime.isAfter(workout.workout.stopAt ?? workout.workout.startAt);
          return isInWindow;
        }).toList();

        if (filteredPoints.isNotEmpty) {
          allPoints.addAll(filteredPoints);
        }
      }
    }

    allPoints.sort((a, b) => a.fetchedAt.compareTo(b.fetchedAt));
    return allPoints;
  }

  void _addTrackWithSmartSegments(
      StringBuffer buffer, String trackName, List<ExtendedPos> points) {
    buffer.writeln('  <trk>');
    buffer.writeln('    <name>${_escapeXml(trackName)}</name>');
    buffer.writeln('    <desc>Тренировка с ${points.length} точками GPS</desc>');
    _addSegments(buffer, points);
    buffer.writeln('  </trk>');
  }

  void _addSegments(StringBuffer buffer, List<ExtendedPos> points) {
    const stopThreshold = Duration(seconds: 10);

    List<ExtendedPos> currentSegment = [];
    int segmentCount = 0;

    for (int i = 0; i < points.length; i++) {
      currentSegment.add(points[i]);

      bool shouldBreakSegment = false;
      String? breakReason;

      if (i < points.length - 1) {
        if (_isStopped(currentSegment, stopThreshold)) {
          shouldBreakSegment = true;
          breakReason = 'stop detected';
        }
      } else {
        shouldBreakSegment = true;
        breakReason = 'end of track';
      }

      if (shouldBreakSegment && currentSegment.length >= 2) {
        segmentCount++;
        _addTrackSegment(buffer, currentSegment, segmentCount, breakReason);
        currentSegment = [points[i]];
      }
    }
  }

  bool _isStopped(List<ExtendedPos> segment, Duration stopThreshold) {
    if (segment.length < 3) return false;

    final recentPoints =
    segment.length > 5 ? segment.sublist(segment.length - 5) : segment;

    final timeSpan =
    recentPoints.last.fetchedAt.difference(recentPoints.first.fetchedAt);

    if (timeSpan < stopThreshold) return false;

    final avgLat =
        recentPoints.map((p) => p.lat).reduce((a, b) => a + b) / recentPoints.length;
    final avgLon =
        recentPoints.map((p) => p.lon).reduce((a, b) => a + b) / recentPoints.length;

    for (final point in recentPoints) {
      final distance = _calculateDistance(avgLat, avgLon, point.lat, point.lon);
      if (distance > 10.0) return false;
    }

    return true;
  }

  double _calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const earthRadius = 6371000.0;

    final dLat = (lat2 - lat1) * pi / 180;
    final dLon = (lon2 - lon1) * pi / 180;

    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(lat1 * pi / 180) *
            cos(lat2 * pi / 180) *
            sin(dLon / 2) *
            sin(dLon / 2);

    final c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  void _addTrackSegment(
      StringBuffer buffer, List<ExtendedPos> segment, int segmentNumber, String? reason) {
    buffer.writeln('    <trkseg>');
    buffer.writeln(
        '      <trkpt lat="${segment.first.lat}" lon="${segment.first.lon}"></trkpt>'); // пример для первой точки
    for (final point in segment) {
      buffer.writeln('      <trkpt lat="${point.lat}" lon="${point.lon}">');
      buffer.writeln('        <time>${_formatDateTime(point.fetchedAt)}</time>');
      buffer.writeln('      </trkpt>');
    }
    buffer.writeln('    </trkseg>');
  }

  void _addEmptyTrack(StringBuffer buffer, String workoutName) {
    buffer.writeln('  <trk>');
    buffer.writeln('    <name>${_escapeXml(workoutName)}</name>');
    buffer.writeln('    <trkseg>');
    buffer.writeln('      <!-- No GPS data available for this workout -->');
    buffer.writeln('    </trkseg>');
    buffer.writeln('  </trk>');
  }

  @override
  String generateFileName(DetailedWorkout workout) {
    final date = workout.workout.startAt;
    final dateStr =
        '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
    final workoutUuid = workout.workout.uuid;
    return 'workout-${workoutUuid.substring(0, 8)}-$dateStr.gpx';
  }

  String _calculateDuration(DateTime start, DateTime stop) {
    final duration = stop.difference(start);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  String _formatDateTime(DateTime dt) {
    final utc = dt.toUtc();
    final withoutMs = DateTime(
        utc.year, utc.month, utc.day, utc.hour, utc.minute, utc.second);
    return withoutMs.toIso8601String();
  }

  String _escapeXml(String text) {
    return text
        .replaceAll('&', '&amp;')
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&gt;')
        .replaceAll('"', '&quot;')
        .replaceAll("'", '&apos;');
  }
}
