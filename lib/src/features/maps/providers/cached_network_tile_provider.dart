import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_map/flutter_map.dart';

class CachedNetworkTileProvider extends NetworkTileProvider {
  final BaseCacheManager cacheManager;

  CachedNetworkTileProvider({
    required this.cacheManager,
  }) : super();

  @override
  ImageProvider getImage(TileCoordinates coordinates, dynamic options) {
    final String tileUrl = getTileUrl(coordinates, options);
    return CachedNetworkImageProvider(
      tileUrl,
      cacheManager: cacheManager,
      headers: headers,
    );
  }
}
