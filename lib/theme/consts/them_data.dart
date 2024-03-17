// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Styles {
  static NativeTemplateStyle nativeTemplateStyle(bool isDarkTheme) {
    return NativeTemplateStyle(
        // Required: Choose a template.
        templateType: TemplateType.medium,
        // Optional: Customize the ad's style.
        mainBackgroundColor: scaffoldColor(isDarkTheme),
        cornerRadius: 30.0,
        callToActionTextStyle: NativeTemplateTextStyle(
            textColor: Color.fromARGB(255, 255, 255, 255),
            backgroundColor:
                isDarkTheme ? const Color(0xFF946F00) : Colors.green,
            style: NativeTemplateFontStyle.monospace,
            size: 20.0),
        primaryTextStyle: NativeTemplateTextStyle(
            // textColor: Colors.amber,
            // textColor: Colors.red,
            backgroundColor: scaffoldColor(isDarkTheme),
            style: NativeTemplateFontStyle.italic,
            size: 16.0),
        secondaryTextStyle: NativeTemplateTextStyle(
            textColor: isDarkTheme
                ? const Color(0xFF946F00)
                : const Color.fromARGB(255, 175, 76, 76),
            backgroundColor: scaffoldColor(isDarkTheme),
            style: NativeTemplateFontStyle.bold,
            size: 16.0),
        tertiaryTextStyle: NativeTemplateTextStyle(
            textColor: const Color.fromARGB(255, 148, 148, 148),
            backgroundColor: Styles.scaffoldColor(isDarkTheme),
            style: NativeTemplateFontStyle.normal,
            size: 16.0));
  }

  static Color scaffoldColor(bool isDarkTheme) {
    return isDarkTheme
        ? Color.fromARGB(255, 32, 34, 39)
        : Color.fromARGB(255, 236, 236, 236);
  }

  static Color activeColor(bool isDarkTheme) {
    return isDarkTheme ? Colors.amber : Color.fromARGB(255, 0, 198, 212);
  }

  static Color textColor(bool isDarkTheme) {
    return isDarkTheme
        ? Color.fromARGB(255, 131, 127, 122)
        : Color.fromARGB(255, 130, 130, 130);
  }

  var brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;
  bool? isDarkMode;
  static ThemeData themeData(
      bool isDarktheme, bool isLargeTxt, BuildContext context) {
    return ThemeData(
        drawerTheme: Theme.of(context).drawerTheme.copyWith(),
        scaffoldBackgroundColor:
            isDarktheme ? const Color(0xFF2E3239) : const Color(0xFFE7ECEF),
        primaryColor: const Color(0xff4E6265),
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: isDarktheme
                  ? const Color.fromARGB(255, 43, 43, 43)
                  : const Color.fromARGB(255, 255, 255, 255),
              brightness: isDarktheme ? Brightness.dark : Brightness.light,
            ),

        // cardColor: isDarktheme
        //     ? Color.fromARGB(255, 85, 48, 3)
        //     : Color.fromRGBO(142, 211, 245, 1),
        timePickerTheme: Theme.of(context).timePickerTheme.copyWith(
              backgroundColor: isDarktheme
                  ? const Color(0xFF2E3239)
                  : const Color(0xFFE7ECEF),
              elevation: 50,
              // dayPeriodColor: Colors.green,
              // dialHandColor: Colors.green,
              dialTextColor: isDarktheme ? Colors.white : Colors.black,
              entryModeIconColor: isDarktheme ? Colors.white : Colors.black,
            ),
        cardTheme: Theme.of(context).cardTheme.copyWith(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),

              // margin: EdgeInsets.all(10),
              color: isDarktheme
                  ? Color.fromARGB(255, 43, 43, 43)
                  : Color.fromARGB(255, 255, 255, 255),
              shadowColor: Colors.black,
              elevation: 15,
            ),
        iconTheme: Theme.of(context).iconTheme.copyWith(
              color: isDarktheme ? Color(0xFF939598) : Color(0xFF939598),
            ),
        canvasColor: isDarktheme
            ? Color.fromARGB(255, 2, 25, 48)
            : Color.fromARGB(255, 130, 159, 164),
        // buttonTheme: Theme.of(context).buttonTheme.copyWith(
        //     colorScheme: isDarktheme
        //         ? const ColorScheme.dark()
        //         : const ColorScheme.light()),
        popupMenuTheme: Theme.of(context).popupMenuTheme.copyWith(
              color: isDarktheme
                  ? Color.fromARGB(255, 43, 43, 43)
                  : Color.fromARGB(255, 255, 255, 255),
            ),
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
              elevation: 0,
              backgroundColor:
                  isDarktheme ? Color(0xFF2E3239) : Color(0xFFE7ECEF),
              foregroundColor: isDarktheme
                  ? Color.fromARGB(255, 130, 121, 105)
                  : Color.fromARGB(255, 130, 121, 105),
            ),
        listTileTheme: Theme.of(context).listTileTheme.copyWith(
              textColor: isDarktheme
                  ? Color.fromARGB(255, 130, 121, 105)
                  : Color.fromARGB(255, 130, 130, 130),
              iconColor: isDarktheme
                  ? Color.fromARGB(255, 130, 121, 105)
                  : Color.fromARGB(255, 130, 130, 130),
              titleTextStyle: TextStyle(fontSize: 18),
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              fixedSize: Size(double.infinity, 130),
              backgroundColor: isDarktheme
                  ? Color.fromARGB(255, 43, 43, 43)
                  : Color.fromARGB(255, 255, 255, 255),
              shadowColor: isDarktheme
                  ? Color.fromARGB(255, 0, 0, 0)
                  : Color.fromARGB(255, 0, 0, 0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              elevation: 20,
              foregroundColor: isDarktheme
                  ? Color.fromARGB(255, 113, 74, 2)
                  : Color.fromARGB(255, 138, 245, 232),
              textStyle: TextStyle(fontSize: 35)),
        ),
        floatingActionButtonTheme:
            Theme.of(context).floatingActionButtonTheme.copyWith(elevation: 20),
        textTheme: Theme.of(context).textTheme.copyWith(
              titleLarge: TextStyle(
                color: isDarktheme
                    ? Color.fromARGB(255, 131, 127, 122)
                    : Color.fromARGB(255, 130, 130, 130),
              ),
              bodyLarge: TextStyle(
                fontSize: isLargeTxt ? 40 : 20,
                fontFamily: 'Segoe',
                color: isDarktheme
                    ? Color.fromARGB(255, 131, 127, 122)
                    : Color.fromARGB(255, 130, 130, 130),
              ),
              bodyMedium: TextStyle(
                fontSize: isLargeTxt ? 30 : 20,
                fontFamily: 'Segoe',
                color: isDarktheme
                    ? Color.fromARGB(255, 131, 127, 122)
                    : Color.fromARGB(255, 130, 130, 130),
              ),
              titleMedium: TextStyle(
                fontSize: isLargeTxt ? 50 : 25,
                fontFamily: 'Arial',
                fontWeight: FontWeight.w500,
                color: isDarktheme
                    ? Color.fromARGB(255, 131, 127, 122)
                    : Color.fromARGB(255, 130, 130, 130),
              ),
              headlineSmall: TextStyle(
                // shadows: [
                //   BoxShadow(
                //     offset: Offset(-5.0, -8.0),
                //     blurRadius: 20.0,
                //     color: isDarktheme
                //         ? Color.fromARGB(171, 10, 10, 10)
                //         : Color.fromARGB(171, 49, 49, 49),
                //   )
                // ],
                fontWeight: FontWeight.bold,
                color: isDarktheme
                    ? Color.fromARGB(255, 130, 121, 105)
                    : Color.fromARGB(255, 130, 130, 130),
              ),
            ),
        scrollbarTheme: Theme.of(context).scrollbarTheme.copyWith(
              interactive: true,
              thumbVisibility: MaterialStatePropertyAll(true),
              thickness: MaterialStatePropertyAll(10),
              radius: Radius.circular(20),
              // thumbColor: ,

              // crossAxisMargin: ,
              mainAxisMargin: 10,
            ),
        iconButtonTheme: IconButtonThemeData(
            style: IconButton.styleFrom(
          elevation: 50,
          shadowColor: Colors.black,
          foregroundColor:
              isDarktheme ? Colors.amber : Colors.lightBlue.shade300,
        )),
        dividerTheme: Theme.of(context).dividerTheme.copyWith(
              indent: 10,
              endIndent: 10,
              thickness: 1,
              color: isDarktheme
                  ? Color.fromARGB(255, 131, 127, 122)
                  : Color.fromARGB(255, 130, 130, 130),
            ));
  }
}
