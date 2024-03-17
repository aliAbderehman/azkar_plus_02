// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class LockPrefs {
  static SharedPreferences? _sharedPrefs;
  static const LOCK_STATUS = 'LOCKSTATUS';
  static const VIBRATE_STATUS = 'VIBRATESTATUS';
  static const AUTO_THEME = 'AUTOTHEMESTATUS';
  static const TRANSLATION_STATE = 'TRANSLATIONSTATUS';

  static Future init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  static Future setLockStatus(bool value) async {
    await _sharedPrefs?.setBool(LOCK_STATUS, value);
  }

  static bool? getLockStatus() => _sharedPrefs?.getBool(LOCK_STATUS) ?? false;

  static void clearLockStatus() {
    _sharedPrefs?.remove(LOCK_STATUS);
  }

  static Future setVibrateStatus(bool value) async {
    await _sharedPrefs?.setBool(VIBRATE_STATUS, value);
  }

  static bool? getVibrateStatus() =>
      _sharedPrefs?.getBool(VIBRATE_STATUS) ?? false;

  static void clearVibrateStatus() {
    _sharedPrefs?.remove(VIBRATE_STATUS);
  }

  static Future setAutoThemeStatus(bool value) async {
    await _sharedPrefs?.setBool(AUTO_THEME, value);
  }

  static bool? getAutoThemeStatus() =>
      _sharedPrefs?.getBool(AUTO_THEME) ?? true;

  static void clearAutuoThemeStatus() {
    _sharedPrefs?.remove(AUTO_THEME);
  }

  static Future setTranslationStatus(bool value) async {
    await _sharedPrefs?.setBool(TRANSLATION_STATE, value);
  }

  static bool? getTranslationStatus() =>
      _sharedPrefs?.getBool(TRANSLATION_STATE) ?? true;

  static void clearTranslationStatus() {
    _sharedPrefs?.remove(TRANSLATION_STATE);
  }
}
