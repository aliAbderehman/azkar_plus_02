import 'package:flutter/material.dart';
import 'package:azkar_plus/materials/custom_styles.dart';
import 'package:azkar_plus/materials/reusable_popup.dart';
import 'package:azkar_plus/theme/services/azkar_bookmark_prefs.dart';

// import '../materials/reusable_popup.dart';

class AzkarBookmark extends StatefulWidget {
  const AzkarBookmark({super.key});

  @override
  State<AzkarBookmark> createState() => _AzkarBookmarkState();
}

List<String> getArabicBookmark = [];
List<String> getAmharicBookmark = [];

// List<String>? theBook ;
class _AzkarBookmarkState extends State<AzkarBookmark> {
  @override
  void initState() {
    getArabicBookmark = AzkarBookmarkPrefs.getAzkarArabicBookmarks()!;
    getAmharicBookmark = AzkarBookmarkPrefs.getAzkarAmharicBookmarks()!;
    super.initState();
  }

  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('አዝካር ዕልባቶች'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                setState(() {
                  AzkarBookmarkPrefs.clearAzkarArabicBookmarks();
                  AzkarBookmarkPrefs.clearAzkarAmharicBookmarks();
                  getArabicBookmark.clear();
                  getAmharicBookmark.clear();
                });
              },
              icon: const Icon(Icons.delete_forever)),
          const ReusablePopUp()
        ],
      ),
      body: ListView.builder(
        itemCount: getArabicBookmark.length,
        itemBuilder: (context, index) {
          int reversOrder = getArabicBookmark.length - 1 - index;
          return Container(
            margin: const EdgeInsets.all(10),
            child: Card(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              getArabicBookmark.removeAt(reversOrder);
                              getAmharicBookmark.removeAt(reversOrder);

                              // BookmarkPrefs.getBookmarks()?.removeAt(index);
                              AzkarBookmarkPrefs.setAzkarArabicBookmark(
                                  getArabicBookmark);
                              AzkarBookmarkPrefs.setAzkarAmharicBookmark(
                                  getAmharicBookmark);
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
                    // morningAzkar[int.parse(getBookmark[reversOrder])]
                    //     .arabicAzkar,
                    getArabicBookmark[reversOrder],
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
                    // morningAzkar[int.parse(getAmharicBookmark[reversOrder])]
                    //     .amharicTranslation,
                    getAmharicBookmark[reversOrder],
                    textAlign: TextAlign.center,
                    style: kAmTextStyle,
                  ),
                  // Text((reversOrder + 1).toString()),
                ],
              ),
            )),
          );
        },
      ),
    );
  }
}
