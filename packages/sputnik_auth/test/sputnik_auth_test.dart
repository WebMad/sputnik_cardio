import 'package:flutter_test/flutter_test.dart';
import 'package:sputnik_auth/sputnik_auth.dart';
import 'package:sputnik_auth/sputnik_auth_platform_interface.dart';
import 'package:sputnik_auth/sputnik_auth_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSputnikAuthPlatform
    with MockPlatformInterfaceMixin
    implements SputnikAuthPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  // final SputnikAuthPlatform initialPlatform = SputnikAuthPlatform.instance;
  //
  // test('$MethodChannelSputnikAuth is the default instance', () {
  //   expect(initialPlatform, isInstanceOf<MethodChannelSputnikAuth>());
  // });
  //
  // test('getPlatformVersion', () async {
  //   SputnikAuth sputnikAuthPlugin = SputnikAuth();
  //   MockSputnikAuthPlatform fakePlatform = MockSputnikAuthPlatform();
  //   SputnikAuthPlatform.instance = fakePlatform;
  //
  //   expect(await sputnikAuthPlugin.getPlatformVersion(), '42');
  // });
}
