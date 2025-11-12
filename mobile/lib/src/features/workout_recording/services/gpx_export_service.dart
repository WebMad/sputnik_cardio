import 'package:sputnik_location/sputnik_location.dart';
import '../models/detailed_workout.dart';

class GpxExportService {
  static String generateGpxContent(DetailedWorkout workout) {
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

  static Map<String, List<ExtendedPos>> _filterRoutesByWorkoutTime(
      Map<String, List<ExtendedPos>> allRoutes,
      DateTime startTime,
      DateTime? stopTime) {
    if (allRoutes.isEmpty) return {};

    final firstRouteName = allRoutes.keys.first;
    final points = allRoutes[firstRouteName]!;

    final validPoints = points.toList();

    if (validPoints.length >= 2) {
      validPoints.sort((a, b) => a.fetchedAt.compareTo(b.fetchedAt));
      return {
        'workout_route': [validPoints.first, validPoints.last]
      };
    } else if (validPoints.isNotEmpty) {
      return {
        'workout_route': [validPoints.first, validPoints.first]
      };
    }

    return {};
  }

  static void _addTrackSegment(
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

  static String generateFileName(DetailedWorkout workout) {
    final date = workout.workout.startAt;
    final dateStr =
        '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
    final workoutUuid = workout.workout.uuid;

    return 'workout-${workoutUuid.substring(0, 8)}-$dateStr.gpx';
  }

  static String _calculateDuration(DateTime start, DateTime stop) {
    final duration = stop.difference(start);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  static String _formatDateTime(DateTime dt) {
    final utc = dt.toUtc();
    final withoutMs = DateTime(
        utc.year, utc.month, utc.day, utc.hour, utc.minute, utc.second);
    return withoutMs.toIso8601String();
  }

  static String _escapeXml(String text) {
    return text
        .replaceAll('&', '&amp;')
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&gt;')
        .replaceAll('"', '&quot;')
        .replaceAll("'", '&apos;');
  }
}
