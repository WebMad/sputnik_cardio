import 'package:sputnik_cardio/src/features/workout_recording/services/gpx_exporter.dart';
import 'package:sputnik_location/sputnik_location.dart';
import '../models/detailed_workout.dart';

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

    final filteredRoutes =
        _filterRoutesByWorkoutTime(workout.routes, startTime, stopTime);

    filteredRoutes.forEach(
      (routeName, points) {
        if (points.isNotEmpty) {
          _addTrackSegment(buffer, routeName, points);
        }
      },
    );

    buffer.writeln('</gpx>');

    return buffer.toString();
  }

  @override
  String generateFileName(DetailedWorkout workout) {
    final date = workout.workout.startAt;
    final dateStr =
        '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
    final workoutUuid = workout.workout.uuid;

    return 'workout-${workoutUuid.substring(0, 8)}-$dateStr.gpx';
  }

  Map<String, List<ExtendedPos>> _filterRoutesByWorkoutTime(
    Map<String, List<ExtendedPos>> allRoutes,
    DateTime startTime,
    DateTime? stopTime,
  ) {
    final result = <String, List<ExtendedPos>>{};
    for (final entry in allRoutes.entries) {
      final routeName = entry.key;
      final points = entry.value;
      if (points.isEmpty) continue;

      final filtered = points.where((p) {
        final t = p.fetchedAt;

        if (stopTime != null) {
          return !t.isBefore(startTime) && !t.isAfter(stopTime);
        } else {
          return !t.isBefore(startTime);
        }
      }).toList();

      if (filtered.isEmpty) continue;
      filtered.sort((a, b) => a.fetchedAt.compareTo(b.fetchedAt));
      result[routeName] = filtered;
    }

    return result;
  }

  void _addTrackSegment(
      StringBuffer buffer, String routeName, List<ExtendedPos> points) {
    buffer.writeln('  <trk>');
    buffer.writeln('    <name>${_escapeXml(routeName)}</name>');
    buffer.writeln('    <trkseg>');

    for (final point in points) {
      buffer.writeln('      <trkpt lat="${point.lat}" lon="${point.lon}">');
      buffer
          .writeln('        <time>${_formatDateTime(point.fetchedAt)}</time>');
      buffer.writeln('      </trkpt>');
    }

    buffer.writeln('    </trkseg>');
    buffer.writeln('  </trk>');
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
