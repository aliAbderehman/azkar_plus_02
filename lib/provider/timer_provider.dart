import 'package:azkar_plus/theme/services/timer_prefs.dart';
import 'package:flutter/material.dart';

class TimerProvider with ChangeNotifier {
  TimerPrefs timerPrefs = TimerPrefs();
  int _hour = 12;
  int _minute = 0;

  int get getHour => _hour;
  int get getMinute => _minute;

  set setHour(int value) {
    _hour = value;
    timerPrefs.setHour(value);
    notifyListeners();
  }

  set setMinute(int value) {
    _minute = value;
    timerPrefs.setMinute(value);
    notifyListeners();
  }

  bool _loading = false;
  bool get loading => _loading;
  setLoad(bool status) {
    _loading = status;
    notifyListeners();
  }

  void clearAllState() {
    timerPrefs.clearAllStatus();
    notifyListeners();
  }
}
