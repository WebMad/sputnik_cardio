import 'package:flutter_sputnik_di/flutter_sputnik_di.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsManager extends Lifecycle {
  SharedPreferences? _sharedPreferences;

  SharedPreferences get sharedPreferences => _sharedPreferences!;

  @override
  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Future<void> dispose() async {
    _sharedPreferences = null;
  }
}
