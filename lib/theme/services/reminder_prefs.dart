// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class ReminderPrefs {
  static SharedPreferences? _sharedPrefs;
  static const REMINDER_STATUS = 'REMINDERSTATUS';
  // static const VIBRATE_STATUS = 'VIBRATESTATUS';

  static Future init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  static Future setReminderStatus(bool value) async {
    await _sharedPrefs?.setBool(REMINDER_STATUS, value);
  }

  static bool? getReminderStatus() =>
      _sharedPrefs?.getBool(REMINDER_STATUS) ?? true;

  static void clearAllStatus() {
    _sharedPrefs?.remove(REMINDER_STATUS);
  }
}
