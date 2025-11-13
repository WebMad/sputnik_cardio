import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';

final _router = Router()
  ..get('/', (Request req) {
    return Response.ok(
      '<html><body><h1>Flutter server работает!</h1></body></html>',
      headers: {'Content-Type': 'text/html'},
    );
  });

Future<void> main(List<String> args) async {
  final handler = const Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(corsHeaders())
      .addHandler(_router);

  final server = await io.serve(handler, InternetAddress.anyIPv4, 8080);
  print('Сервер запущен на http://${server.address.host}:${server.port}');
}
