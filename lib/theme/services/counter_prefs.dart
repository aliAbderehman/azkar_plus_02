import 'package:shared_preferences/shared_preferences.dart';

class CounterPrefs {
  static SharedPreferences? _counterPrefs;

  static const _keyCounter = 'total_counter';

  static Future init() async {
    _counterPrefs ??= await SharedPreferences.getInstance();
  }

  static Future setTotalCount(int totalCount) async =>
      await _counterPrefs?.setInt(_keyCounter, totalCount);

  static int? getTotalCount() => _counterPrefs?.getInt(_keyCounter) ?? 0;

  static void clearTotalCount() {
    _counterPrefs?.remove(_keyCounter);
  }
}
