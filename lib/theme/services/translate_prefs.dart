// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class TranslatePrefs {
  static SharedPreferences? _sharedPrefs;
  static const TRANSLATE_ATATUS = 'TRANSLATESTATUS';
  // static const VIBRATE_STATUS = 'VIBRATESTATUS';

  static Future init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  static Future setTranslateStatus(bool value) async {
    await _sharedPrefs?.setBool(TRANSLATE_ATATUS, value);
  }

  static bool? getTranslateStatus() =>
      _sharedPrefs?.getBool(TRANSLATE_ATATUS) ?? true;

  static void clearAllStatus() {
    _sharedPrefs?.remove(TRANSLATE_ATATUS);
  }
}
