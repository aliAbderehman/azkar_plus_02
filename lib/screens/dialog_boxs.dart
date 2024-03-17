import 'package:azkar_plus/theme/services/lock_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

Future<dynamic> showBookDialog(BuildContext context, themeState) {
  var brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;
  bool isDarkMode = brightness == Brightness.dark;
  return showDialog(
    builder: (context) {
      return SimpleDialog(
        backgroundColor: themeState.getDarkTheme
            ? const Color(0xFF2E3239)
            : const Color(0xFFE7ECEF),
        children: [
          SimpleDialogOption(
            onPressed: () {
              // setState(() {
              LockPrefs.setAutoThemeStatus(true);
              themeState.setDarkTheme = isDarkMode;

              Navigator.of(context).pop();
              // });
            },
            child: const Text('Auto'),
          ),
          SimpleDialogOption(
            onPressed: () {
              // setState(() {
              themeState.setDarkTheme = false;
              LockPrefs.setAutoThemeStatus(false);

              Navigator.of(context).pop();
              // });
            },
            child: const Text('Light'),
          ),
          SimpleDialogOption(
            // textColor: Colors.black,
            onPressed: () {
              // setState(() {
              themeState.setDarkTheme = true;
              LockPrefs.setAutoThemeStatus(false);

              Navigator.of(context).pop();
              // });
            },
            child: const Text('Dark'),
          ),
        ],
      );
    },
    context: context,
  );
}

Future<dynamic> showSizeDialog(BuildContext context, textState) {
  return showDialog(
    builder: (context) {
      return SimpleDialog(
        backgroundColor: textState.getTextSize
            ? const Color(0xFF2E3239)
            : const Color(0xFFE7ECEF),
        children: [
          SimpleDialogOption(
            onPressed: () {
              // setState(() {
              textState.setTextSize = false;

              Navigator.of(context).pop();
              // });
            },
            child: const Text('Normal'),
          ),
          SimpleDialogOption(
            onPressed: () {
              textState.setTextSize = true;

              Navigator.of(context).pop();
            },
            child: const Text('Large'),
          ),
        ],
      );
    },
    context: context,
  );
}
