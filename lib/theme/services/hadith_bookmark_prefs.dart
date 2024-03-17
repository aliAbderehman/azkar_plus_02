import 'package:shared_preferences/shared_preferences.dart';

class HadithBookmarkPrefs {
  static SharedPreferences? _sharedPrefs;

  // static const _keyCounter = 'total_counter';
  static const String hadithBookmarkKey = 'hadithKey';
  // static const String prefBookmarkId = 'bookmarkId';

  static Future init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  static Future setHadithBookmarks(List<String> bookmarks) async =>
      await _sharedPrefs?.setStringList(hadithBookmarkKey, bookmarks);

  static List<String>? getHadithBookmarks() =>
      _sharedPrefs?.getStringList(hadithBookmarkKey) ?? [];

  // static Future setBookmarkId(int bookmarkId) async =>
  //     await _sharedPrefs?.setInt(prefBookmarkId, bookmarkId);

  // static int? getBookmarkId() => _sharedPrefs?.getInt(prefBookmarkKey) ?? 0;

// static void removeBookmark(index){
// _sharedPrefs?.remove(index)
// }

  static void clearHadithBookmarks() {
    _sharedPrefs?.remove(hadithBookmarkKey);
    // _sharedPrefs.
  }
}




// import 'package:shared_preferences/shared_preferences.dart';

// class HadithBookmarkPrefs {
//   static SharedPreferences? _sharedPrefs;

//   // static const _keyCounter = 'total_counter';
//   static const String prefBookmarkKey = 'hadithBookmarkKey';
//   static const String prefBookmarkId = 'bookmarkId';

//   static Future init() async {
//     _sharedPrefs ??= await SharedPreferences.getInstance();
//   }

//   static Future setHadithBookmarks(List<String> bookmarks) async =>
//       await _sharedPrefs?.setStringList(prefBookmarkKey, bookmarks);

//   static List<String>? getHadithBookmarks() =>
//       _sharedPrefs?.getStringList(prefBookmarkKey) ?? [];

//   // static Future setBookmarkId(int bookmarkId) async =>
//   //     await _sharedPrefs?.setInt(prefBookmarkId, bookmarkId);

//   // static int? getBookmarkId() => _sharedPrefs?.getInt(prefBookmarkKey) ?? 0;

// // static void removeBookmark(index){
// // _sharedPrefs?.remove(index)
// // }
//   static void clearHadithBookmarks() {
//     _sharedPrefs?.remove(prefBookmarkKey);
//   }
// }
