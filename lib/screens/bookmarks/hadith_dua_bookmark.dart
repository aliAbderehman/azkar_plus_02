import 'package:flutter/material.dart';
import 'package:azkar_plus/materials/custom_styles.dart';
import 'package:azkar_plus/materials/reusable_popup.dart';
import 'package:azkar_plus/resource/dua_sunna_ar_list.dart';
import 'package:azkar_plus/resource/dua_sunna_am.dart';
import 'package:azkar_plus/theme/services/hadith_bookmark_prefs.dart';

// import '../materials/reusable_popup.dart';

class HadithDuaBookmarkScreen extends StatefulWidget {
  const HadithDuaBookmarkScreen({super.key});

  @override
  State<HadithDuaBookmarkScreen> createState() =>
      _HadithDuaBookmarkScreenState();
}

List<String> getBookmark = [];

// List<String>? theBook ;
class _HadithDuaBookmarkScreenState extends State<HadithDuaBookmarkScreen> {
  @override
  void initState() {
    getBookmark = HadithBookmarkPrefs.getHadithBookmarks()!;
    // print(getBookmark);
    super.initState();
  }

  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ዱዓ/ሃዲስ ዕልባቶች'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                setState(() {
                  HadithBookmarkPrefs.clearHadithBookmarks();
                  getBookmark.clear();
                });
              },
              icon: const Icon(Icons.delete_forever)),
          const ReusablePopUp()
        ],
      ),
      body: ListView.builder(
        itemCount: getBookmark.length,
        itemBuilder: (context, index) {
          int reversOrder = getBookmark.length - 1 - index;
          return Container(
            margin: const EdgeInsets.all(10),
            child: Card(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              getBookmark.removeAt(reversOrder);
                              // BookmarkPrefs.getBookmarks()?.removeAt(index);
                              HadithBookmarkPrefs.setHadithBookmarks(
                                  getBookmark);
                            });
                          },
                          icon: const Icon(Icons.bookmark_added)),
                      CircleAvatar(
                        child: Text((index + 1).toString()),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    duaHadithAr[int.parse(getBookmark[reversOrder])],
                    style: kArTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    duaHadithAm[int.parse(getBookmark[reversOrder])],
                    style: kAmTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text((reversOrder + 1).toString()),
                ],
              ),
            )),
          );
        },
      ),
    );
  }
}
