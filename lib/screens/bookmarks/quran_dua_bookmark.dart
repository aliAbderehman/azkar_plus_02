import 'package:flutter/material.dart';
import 'package:azkar_plus/materials/custom_styles.dart';
import 'package:azkar_plus/materials/reusable_popup.dart';
import 'package:azkar_plus/resource/dua_quran_am_list.dart';
import 'package:azkar_plus/resource/dua_quran_ar_list%20.dart';
import 'package:azkar_plus/resource/dua_quran_index01.dart';
import 'package:azkar_plus/theme/services/quran_bookmark_prefs.dart';

// import '../materials/reusable_popup.dart';

class QuranDuaBookmarkScreen extends StatefulWidget {
  const QuranDuaBookmarkScreen({super.key});

  @override
  State<QuranDuaBookmarkScreen> createState() => _QuranDuaBookmarkScreenState();
}

List<String> getBookmark = [];

// List<String>? theBook ;
class _QuranDuaBookmarkScreenState extends State<QuranDuaBookmarkScreen> {
  @override
  void initState() {
    getBookmark = QuranBookmarkPrefs.getQuranBookmarks()!;
    // print(getBookmark);
    super.initState();
  }

  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ቁራዓን ዱዓ ዕልባቶች'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                setState(() {
                  QuranBookmarkPrefs.clearQuranBookmarks();
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
                              QuranBookmarkPrefs.setQuranBookmarks(getBookmark);
                            });
                          },
                          icon: const Icon(Icons.bookmark_added)),
                      CircleAvatar(
                        child: Text((index + 1).toString()),
                      )
                    ],
                  ),
                  Text(
                    duaQuranAr[int.parse(getBookmark[reversOrder])],
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
                    duaQuranAm[int.parse(getBookmark[reversOrder])],
                    style: kAmTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(duaQuranIndex[int.parse(getBookmark[reversOrder])]),
                ],
              ),
            )),
          );
        },
      ),
    );
  }
}
