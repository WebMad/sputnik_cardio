import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'sputnik_auth_method_channel.dart';

abstract class SputnikAuthPlatform extends PlatformInterface {
  /// Constructs a SputnikAuthPlatform.
  SputnikAuthPlatform() : super(token: _token);

  static final Object _token = Object();

  static SputnikAuthPlatform _instance = MethodChannelSputnikAuth();

  /// The default instance of [SputnikAuthPlatform] to use.
  ///
  /// Defaults to [MethodChannelSputnikAuth].
  static SputnikAuthPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SputnikAuthPlatform] when
  /// they register themselves.
  static set instance(SputnikAuthPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
