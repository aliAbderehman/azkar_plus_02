// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class TimerPrefs {
  // static SharedPreferences? _sharedPrefs;
  static const HOUR = 'TIMERSTATUS';
  static const MINUTE = 'MINUTES';

// static const TEXT_STATUS = 'TEXTSTATUS';

  setHour(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(HOUR, value);
  }

  Future<int> getHour() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(HOUR) ?? 12;
  }

  setMinute(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(MINUTE, value);
  }

  Future<int> getMinute() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(MINUTE) ?? 0;
  }

  void clearAllStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove(HOUR);
    prefs.remove(MINUTE);
  }
}
