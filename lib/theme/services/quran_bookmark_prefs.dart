import 'package:shared_preferences/shared_preferences.dart';

class QuranBookmarkPrefs {
  static SharedPreferences? _sharedPrefs;

  // static const _keyCounter = 'total_counter';
  static const String prefBookmarkKey = 'previousSearches';
  static const String prefBookmarkId = 'bookmarkId';

  static Future init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  static Future setQuranBookmarks(List<String> bookmarks) async =>
      await _sharedPrefs?.setStringList(prefBookmarkKey, bookmarks);

  static List<String>? getQuranBookmarks() =>
      _sharedPrefs?.getStringList(prefBookmarkKey) ?? [];

  // static Future setBookmarkId(int bookmarkId) async =>
  //     await _sharedPrefs?.setInt(prefBookmarkId, bookmarkId);

  // static int? getBookmarkId() => _sharedPrefs?.getInt(prefBookmarkKey) ?? 0;

// static void removeBookmark(index){
// _sharedPrefs?.remove(index)
// }

  static void clearQuranBookmarks() {
    _sharedPrefs?.remove(prefBookmarkKey);
    // _sharedPrefs.
  }
}
