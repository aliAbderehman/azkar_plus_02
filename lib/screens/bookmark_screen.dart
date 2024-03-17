// import 'dart:js_interop';

import 'package:azkar_plus/provider/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:azkar_plus/admob/ad_helper.dart';
import 'package:azkar_plus/materials/morphis_button_rect.dart';
import 'package:azkar_plus/theme/services/azkar_bookmark_prefs.dart';
import 'package:azkar_plus/theme/services/quran_bookmark_prefs.dart';
// import 'package:hajj_and_umra_03/resource/dua_quran_am_list.dart';
// import 'package:hajj_and_umra_03/resource/dua_quran_ar_list%20.dart';
// import 'package:hajj_and_umra_03/resource/dua_quran_index01.dart';
// import 'package:hajj_and_umra_03/theme/services/bookmark_prefs.dart';
import 'package:azkar_plus/theme/services/hadith_bookmark_prefs.dart';
import 'package:provider/provider.dart';

import '../materials/reusable_popup.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

bool bookmarkListener = false;
bool hadithNotEmpty = false;
bool quranNotEmpty = false;
bool azkarNotEmpty = false;

class _FaqScreenState extends State<FaqScreen> {
  List<String>? quranbook;

  @override
  void initState() {
    setState(() {});
    quranbook = QuranBookmarkPrefs.getQuranBookmarks() ?? [];
    refresh();
    initBannerAd();
    super.initState();
  }

  late BannerAd _bannerAd;

  bool _isBannerAdReady = false;

  initBannerAd() {
    _bannerAd = BannerAd(
      // AdHelper.bannerAdUnitId
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );
    _bannerAd.load();
  }

  void refresh() {
    setState(() {
      if (HadithBookmarkPrefs.getHadithBookmarks()!.isNotEmpty ||
          QuranBookmarkPrefs.getQuranBookmarks()!.isNotEmpty ||
          AzkarBookmarkPrefs.getAzkarArabicBookmarks()!.isNotEmpty) {
        bookmarkListener = true;
      } else {
        bookmarkListener = false;
      }

      if (QuranBookmarkPrefs.getQuranBookmarks()!.isNotEmpty) {
        quranNotEmpty = true;
      } else {
        quranNotEmpty = false;
      }

      if (AzkarBookmarkPrefs.getAzkarArabicBookmarks()!.isNotEmpty) {
        azkarNotEmpty = true;
      } else {
        azkarNotEmpty = false;
      }

      if (HadithBookmarkPrefs.getHadithBookmarks()!.isNotEmpty) {
        hadithNotEmpty = true;
      } else {
        hadithNotEmpty = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('ዕልባቶች'),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  showBookDialog(context, themeState);
                },
                icon: const Icon(Icons.delete_forever)),
            const ReusablePopUp()
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: _bannerAd.size.height.toDouble(),
          width: _bannerAd.size.width.toDouble(),
          child: _isBannerAdReady ? AdWidget(ad: _bannerAd) : null,
        ),
        body: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            if (quranNotEmpty)
              Center(
                  child: MorphisButtonRect(
                alignment: Alignment.center,
                icon: Text('ዱዓ/ቁርዓን ዕልባቶች',
                    style: Theme.of(context).textTheme.headlineSmall),
                onPressed: () {
                  Navigator.pushNamed(context, 'quran_dua_bookmark')
                      .then((_) => refresh());
                },
              )),
            const SizedBox(
              height: 15,
            ),
            if (hadithNotEmpty)
              Center(
                  child: MorphisButtonRect(
                alignment: Alignment.center,
                icon: Text('ዱዓ/ሃዲስ ዕልባቶች',
                    style: Theme.of(context).textTheme.headlineSmall),
                onPressed: () {
                  Navigator.pushNamed(context, 'hadith_dua_bookmark')
                      .then((_) => refresh());
                },
              )),
            const SizedBox(
              height: 15,
            ),
            if (azkarNotEmpty)
              Center(
                  child: MorphisButtonRect(
                alignment: Alignment.center,
                icon: Text('አዝካር ዕልባቶች',
                    style: Theme.of(context).textTheme.headlineSmall),
                onPressed: () {
                  Navigator.pushNamed(context, 'azkar_bookmark_screen')
                      .then((_) => refresh());
                },
              )),
            if (!bookmarkListener)
              Center(
                child: Text('ምንም ዕልባት አልተገኘም',
                    style: Theme.of(context).textTheme.headlineSmall),
              ),
          ],
        ));
  }

  Future<dynamic> showBookDialog(BuildContext context, themeState) {
    return showDialog(
      builder: (context) {
        return AlertDialog(
          title: const Text('አጥፋ?'),
          content: const Text('እልባቶችን በሙሉ ይጥፉ?'),
          actions: [
            TextButton(
              // FlatButton widget is used to make a text to work like a button
              // style: ButtonStyle(foregroundColor) ,
              onPressed: () {
                Navigator.of(context).pop();
              }, // function used to perform after pressing the button
              child: const Text('CANCEL'),
            ),
            TextButton(
              // textColor: Colors.black,
              onPressed: () {
                setState(() {
                  HadithBookmarkPrefs.clearHadithBookmarks();
                  QuranBookmarkPrefs.clearQuranBookmarks();
                  AzkarBookmarkPrefs.clearAzkarAmharicBookmarks();
                  AzkarBookmarkPrefs.clearAzkarArabicBookmarks();
                  refresh();
                  Navigator.of(context).pop();
                });
              },
              child: const Text('YES'),
            ),
          ],
          backgroundColor: themeState.getDarkTheme
              ? const Color(0xFF2E3239)
              : const Color(0xFFE7ECEF),
        );
      },
      context: context,
    );
  }
}


// ListView.builder(
//           itemCount: 1,
//           itemBuilder: (context, builder) {
//             if (QuranBookmarkPrefs.getQuranBookmarks()!.isEmpty) {
//               return Center(
//                 child: Text('ምንም ዕልባት አልተገኘም'),
//               );
//             } else {
//               return Center(child: MorphisButtonRect(
//                 onPressed: () {
//                   Navigator.pushNamed(context, 'quran_dua_bookmark');
//                 },
//               ));
//             }
//           }),

// HadithBookmarkPrefs.getHadithBookmarks()!.isEmpty
//                 ? Center(child: Text('ምንም ዕልባት አልተገኘም'))
//                 : Center(
//                     child: MorphisButtonRect(
//                     lable: Text('የሃዲስ ዱዓ ዕልባቶች'),
//                     onPressed: () {
//                       Navigator.pushNamed(context, 'hadith_dua_bookmark');
//                     },
//                   )),