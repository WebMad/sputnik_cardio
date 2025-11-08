import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'sputnik_auth_platform_interface.dart';

/// An implementation of [SputnikAuthPlatform] that uses method channels.
class MethodChannelSputnikAuth extends SputnikAuthPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('sputnik_auth');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
