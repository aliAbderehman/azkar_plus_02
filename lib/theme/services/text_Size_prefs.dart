// ignore_for_file: file_names, constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class TextSizePref {
  static const TEXT_STATUS = 'TEXTSTATUS';

  setTextSize(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(TEXT_STATUS, value);
  }

  Future<bool> getTextSize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(TEXT_STATUS) ?? false;
  }

  // static const REMINDER_STATUS = 'REMINDERSTATUS';

  // setReminderStatus(bool value) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setBool(REMINDER_STATUS, value);
  // }

  // Future<bool> getReminderStatus() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getBool(REMINDER_STATUS) ?? true;
  // }

  void clearAllStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove(TEXT_STATUS);
  }
}
