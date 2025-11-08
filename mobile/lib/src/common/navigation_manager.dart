import 'package:flutter/cupertino.dart';

class NavigationManager {
  final navigatorKey = GlobalKey<NavigatorState>();

  String _initialPage = '/auth';

  String get initialPage => _initialPage;

  void openMainPage() {
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      '/',
      (route) => false,
    );

    _initialPage = '/';
  }

  void openAuthPage() {
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      '/auth',
      (route) => false,
    );

    _initialPage = '/auth';
  }
}
