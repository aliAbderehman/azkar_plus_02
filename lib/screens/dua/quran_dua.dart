import 'package:azkar_plus/theme/services/translate_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:azkar_plus/resource/dua_quran_am_list.dart';
import 'package:azkar_plus/resource/dua_quran_ar_list .dart';
import 'package:azkar_plus/resource/dua_quran_index01.dart';
import 'package:azkar_plus/theme/services/quran_bookmark_prefs.dart';
import 'package:azkar_plus/materials/custom_styles.dart';

import '../../materials/reusable_popup.dart';

class QuranDua extends StatelessWidget {
  const QuranDua({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const SliverAppBar(
            actions: <Widget>[ReusablePopUp()],
            snap: true,
            floating: true,
            title: Text('ዱዓ ከቁርዓን'),
          )
        ],
        body: Scrollbar(
          child: ListView.builder(
              itemCount: duaQuranAm.length,
              itemBuilder: (context, index) {
                return TextBox(
                  txt2: TranslatePrefs.getTranslateStatus()!
                      ? duaQuranAm[index]
                      : '',
                  txt1: duaQuranAr[index],
                  txt3: duaQuranIndex[index],
                  index: (++index).toString(),
                );
              }),
        ),
      ),
    );
  }
}

class TextBox extends StatefulWidget {
  const TextBox(
      {super.key,
      required this.txt1,
      required this.txt2,
      required this.index,
      required this.txt3});
  final String txt1;
  final String txt2;
  final String txt3;

  final String index;

  @override
  State<TextBox> createState() => _TextBoxState();
}

List<String> bookmarks = [];
List<String> bookmarks1 = [];

class _TextBoxState extends State<TextBox> {
  bool isPressed = false;

  @override
  void initState() {
    bookmarks1 = QuranBookmarkPrefs.getQuranBookmarks()!;
    bookmarks = QuranBookmarkPrefs.getQuranBookmarks()!;

    super.initState();
  }

  @override
  void dispose() {
    QuranBookmarkPrefs.setQuranBookmarks(bookmarks);
    super.dispose();
  }

  void bookmark(int coIndex) {
    if (bookmarks.contains((coIndex.toString()))) {
      bookmarks.removeWhere((element) => element == coIndex.toString());
      QuranBookmarkPrefs.setQuranBookmarks(bookmarks);
    } else {
      bookmarks.add(((int.parse(widget.index) - 1).toString()));
      QuranBookmarkPrefs.setQuranBookmarks(bookmarks);
    }
  }

  void copy() {
    final value = ClipboardData(
        text:
            '${widget.txt1} \n ${widget.txt2}\n ${widget.txt3} \nአፑን ከፕላይስቶር ያውርዱ፡ htttps://example');
    Clipboard.setData(value);
  }

  @override
  Widget build(BuildContext context) {
    if (bookmarks.contains(((int.parse(widget.index) - 1).toString()))) {
      isPressed = true;
    } else {
      isPressed = false;
    }
    int coIndex = (int.parse(widget.index) - 1);

    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          bookmark(coIndex);
                          isPressed = !isPressed;
                        });
                      },
                      icon: isPressed
                          ? const Icon(Icons.bookmark_added)
                          : const Icon(Icons.bookmark_add_outlined),
                      // iconSize: 25,
                    ),
                    IconButton(
                      // iconSize: 25,
                      onPressed: () {
                        setState(() {
                          // print(bookmarks);
                          // BookmarkPrefs.clearBookmarks();
                        });
                      },
                      icon: const Icon(Icons.share_outlined),
                    ),
                    IconButton(
                      // iconSize: 25,
                      onPressed: () {
                        copy();
                      },
                      icon: const Icon(Icons.copy_outlined),
                    )
                  ],
                ),
                CircleAvatar(
                  child: Text(widget.index),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.txt1,
              textDirection: TextDirection.rtl,
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
            CustomDuaText(
              widget: widget,
              fontFamily: 'Nyala',
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.txt3,
              style: const TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDuaText extends StatelessWidget {
  const CustomDuaText({
    super.key,
    required this.widget,
    this.fontFamily,
    this.fontSize,
  });

  final TextBox widget;
  final String? fontFamily;
  final int? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.txt2,
      style: TextStyle(fontFamily: fontFamily ?? '', fontSize: 22),
      textAlign: TextAlign.center,
    );
  }
}
