import 'package:shared_preferences/shared_preferences.dart';

class AzkarBookmarkPrefs {
  static SharedPreferences? _sharedPrefs;

  static const String azkarArabicBookmarkKey = 'ArabicAzkarKey';
  static const String azkarAmharicBookmarkKey = 'AmharicAzkarKey';

  static Future init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  static Future setAzkarArabicBookmark(List<String> bookmarks) async =>
      await _sharedPrefs?.setStringList(azkarArabicBookmarkKey, bookmarks);

  static List<String>? getAzkarArabicBookmarks() =>
      _sharedPrefs?.getStringList(azkarArabicBookmarkKey) ?? [];

  static void clearAzkarArabicBookmarks() {
    _sharedPrefs?.remove(azkarArabicBookmarkKey);
    // _sharedPrefs.
  }

  static Future setAzkarAmharicBookmark(List<String> bookmarks) async =>
      await _sharedPrefs?.setStringList(azkarAmharicBookmarkKey, bookmarks);

  static List<String>? getAzkarAmharicBookmarks() =>
      _sharedPrefs?.getStringList(azkarAmharicBookmarkKey) ?? [];

  static void clearAzkarAmharicBookmarks() {
    _sharedPrefs?.remove(azkarAmharicBookmarkKey);
    // _sharedPrefs.
  }
}
