import 'package:azkar_plus/app_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/services/azkar_bookmark_prefs.dart';

List<String> arabicAzkarBookmarks = [];
List<String> amharicAzkarBookmarks = [];

class CardActionButtons extends StatefulWidget {
  const CardActionButtons(
      {super.key,
      // required this.copy,
      required this.share,
      // required this.saveBookmark,
      // required this.isPressed,
      this.tx1,
      this.tx2,
      this.co});

  // final Function saveBookmark;
  final String? tx1, tx2;
  final int? co;
  final Function share;

  @override
  State<CardActionButtons> createState() => _CardActionButtonsState();
}

class _CardActionButtonsState extends State<CardActionButtons> {
  // bool isPressed = false;
  bool isPressed = false;

  void copy() {
    final value = ClipboardData(
        text:
            '${widget.tx1} \n ${widget.tx2}\n \nአፑን ከፕላይስቶር ያውርዱ፡ htttps://example');
    Clipboard.setData(value);
  }

  void addBookmark() {
    setState(() {
      if (arabicAzkarBookmarks.contains(widget.tx1)) {
        arabicAzkarBookmarks.removeWhere((element) => element == widget.tx1);
        AzkarBookmarkPrefs.setAzkarArabicBookmark(arabicAzkarBookmarks);
        amharicAzkarBookmarks.removeWhere((element) => element == widget.tx2);
        AzkarBookmarkPrefs.setAzkarAmharicBookmark(amharicAzkarBookmarks);

        isPressed = false;
      } else {
        arabicAzkarBookmarks.add(widget.tx1!);
        AzkarBookmarkPrefs.setAzkarArabicBookmark(arabicAzkarBookmarks);
        amharicAzkarBookmarks.add(widget.tx2!);
        AzkarBookmarkPrefs.setAzkarAmharicBookmark(amharicAzkarBookmarks);

        isPressed = true;
      }
    });
  }

  @override
  void initState() {
    arabicAzkarBookmarks = AzkarBookmarkPrefs.getAzkarArabicBookmarks()!;
    amharicAzkarBookmarks = AzkarBookmarkPrefs.getAzkarAmharicBookmarks()!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (arabicAzkarBookmarks.contains(widget.tx1.toString())) {
      setState(() {
        isPressed = true;
      });
    } else {
      setState(() {
        isPressed = false;
      });
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 68, 169, 48),
          foregroundColor: Colors.white,
          child: IconButton(
            onPressed: addBookmark,
            icon: isPressed
                ? const Icon(Icons.bookmark_added)
                : const Icon(Icons.bookmark_add),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        CircleAvatar(
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white,
          child: IconButton(
            onPressed: () {
              ShareApp.shareApp();
            },
            icon: const Icon(Icons.share),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 218, 166, 10),
          foregroundColor: Colors.white,
          child: IconButton(
            onPressed: copy,
            icon: const Icon(Icons.copy_rounded),
          ),
        )
      ],
    );
  }
}
