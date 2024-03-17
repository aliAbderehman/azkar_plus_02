import 'package:flutter/material.dart';

import 'package:azkar_plus/theme/services/text_Size_prefs.dart';

class TextSizeProvider with ChangeNotifier {
  TextSizePref textSizePrefs = TextSizePref();
  bool _textSize = false;

  bool get getTextSize => _textSize;

  set setTextSize(bool value) {
    _textSize = value;
    textSizePrefs.setTextSize(value);
    notifyListeners();
  }

  bool _loading = false;
  bool get loading => _loading;
  setLoad(bool status) {
    _loading = status;
    notifyListeners();
  }
}
