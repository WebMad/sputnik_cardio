import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';

class AppInitializeStateHolder extends StateHolder<bool> {
  AppInitializeStateHolder() : super(false);

  void initialized() {
    state = true;
  }

  void disposed() {
    state = false;
  }
}