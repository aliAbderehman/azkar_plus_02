import 'package:azkar_plus/app_link.dart';
import 'package:azkar_plus/notificationservice.dart';
import 'package:azkar_plus/provider/timer_provider.dart';
import 'package:azkar_plus/screens/dialog_boxs.dart';
import 'package:azkar_plus/theme/consts/them_data.dart';
import 'package:azkar_plus/theme/services/azkar_bookmark_prefs.dart';
import 'package:azkar_plus/theme/services/counter_prefs.dart';
import 'package:azkar_plus/theme/services/hadith_bookmark_prefs.dart';
import 'package:azkar_plus/theme/services/lock_prefs.dart';
import 'package:azkar_plus/theme/services/quran_bookmark_prefs.dart';
import 'package:azkar_plus/theme/services/reminder_prefs.dart';
import 'package:azkar_plus/theme/services/translate_prefs.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:azkar_plus/provider/text_size_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../provider/dark_theme_provider.dart';

const isReminder = false;

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    // final timer = Provider.of<TimerProvider>(context);
    final myTimer = Provider.of<TimerProvider>(context);
    final textState = Provider.of<TextSizeProvider>(context);

    NotificationService ns = NotificationService();

    TimeOfDay time =
        TimeOfDay(hour: myTimer.getHour, minute: myTimer.getMinute);

    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        title: const Row(
          children: [
            Image(
              image: AssetImage('assets/logo/right_07.png'),
              height: 30,
              width: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Azkar Plus Amharic',
              // style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
      // backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const SafeArea(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(themeState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined),
                  title: const Text('Theme'),
                  onTap: () {
                    showBookDialog(context, themeState);
                  },
                ),
                const Divider(),
                SwitchListTile(
                    activeColor: const Color.fromARGB(255, 203, 138, 17),
                    title: const Text('Translation'),
                    secondary: const Icon(Icons.translate_rounded),
                    value: TranslatePrefs.getTranslateStatus()!,
                    onChanged: (bool value) {
                      setState(() {
                        TranslatePrefs.setTranslateStatus(value);
                      });
                    }),
                const Divider(),
                ListTile(
                    title: const Text('Font Size'),
                    leading: const Icon(Icons.format_size_rounded),
                    onTap: () {
                      showSizeDialog(context, textState);
                    }),
                const Divider(),
                SwitchListTile(
                    activeColor: const Color.fromARGB(255, 203, 138, 17),
                    title: const Text('Reminder'),
                    secondary: const Icon(Icons.notifications_outlined),
                    value: ReminderPrefs.getReminderStatus()!,
                    onChanged: (bool value) {
                      setState(() {
                        ReminderPrefs.setReminderStatus(value);
                        ns.scheduleDailyTenAMNotification(timer: myTimer);
                      });
                      if (ReminderPrefs.getReminderStatus() == false) {
                        ns.cancelAllNotifications();
                      }
                    }),
                const Divider(),
                ReminderPrefs.getReminderStatus()!
                    ? ListTile(
                        enableFeedback: false,
                        title: const Text('Reminder Time'),
                        leading: const Icon(Icons.alarm),
                        onTap: ReminderPrefs.getReminderStatus()!
                            ? () async {
                                // getTime(
                                //     context: context, themeState: themeState, timer: timer);
                                TimeOfDay? newTime = await showTimePicker(
                                    context: context, initialTime: time);
                                if (newTime == null) return;
                                setState(() {
                                  time = newTime;
                                  ReminderPrefs.setReminderStatus(true);
                                  myTimer.setHour = time.hour;
                                  myTimer.setMinute = time.minute;
                                  String dayPeriod =
                                      time.hour <= 11 ? 'AM' : 'PM';
                                  DateTime currentTime = DateTime.now();

                                  DateTime alarmTime = DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      DateTime.now().day,
                                      time.hour,
                                      time.minute);

                                  Duration remainingDuration =
                                      alarmTime.isAfter(currentTime)
                                          ? alarmTime.difference(currentTime)
                                          : Duration();

                                  int remainingHour = remainingDuration.inHours;
                                  // int remainingMinute = remainingDuration.inMinutes;

                                  Fluttertoast.showToast(
                                    msg:
                                        "Reminder set to ${time.hour % 12}:${time.minute} $dayPeriod\n Remaining time $remainingHour  ",
                                    toastLength: Toast.LENGTH_SHORT,
                                    fontSize: 20,
                                  );
                                });

                                ns.scheduleDailyTenAMNotification(
                                    timer: myTimer);
                              }
                            : () {},
                      )
                    : ListTile(
                        iconColor: themeState.getDarkTheme
                            ? Color.fromARGB(255, 32, 34, 39)
                            : Color.fromARGB(255, 255, 255, 255),
                        textColor: themeState.getDarkTheme
                            ? Color.fromARGB(255, 32, 34, 39)
                            : Color.fromARGB(255, 255, 255, 255),
                        title: const Text('Reminder Time'),
                        leading: const Icon(Icons.alarm),
                      ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.star_rate_outlined),
                  title: const Text('Rate Us'),
                  onTap: () async {
                    final Uri url = Uri.parse(
                        'https://play.google.com/store/apps/details?id=com.ankabootechs.akarplusamharic&pcampaignid=web_share');

                    if (await canLaunchUrl(url)) {
                      await launchUrl(
                        url,
                        mode: LaunchMode.externalApplication,
                        webViewConfiguration: const WebViewConfiguration(),
                      );
                    }
                  },
                ),
                const Divider(),
                ListTile(
                  onTap: () {
                    ShareApp.shareApp();
                  },
                  leading: const Icon(Icons.share_outlined),
                  title: const Text('Share this app'),
                ),
                const Divider(),
                ListTile(
                  onTap: () async {
                    final Uri url = Uri.parse('https://www.ankabootechs.com');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(
                        url,
                        mode: LaunchMode.externalApplication,
                        webViewConfiguration: const WebViewConfiguration(),
                      );
                    }
                  },
                  leading: const Icon(FontAwesomeIcons.addressCard),
                  title: const Text('Developer Contact'),
                ),
                const Divider(),
                ListTile(
                  onTap: () async {
                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'developer@ankabootechs.com',
                      // query: encodeQueryParameters(<String, String>{
                      //   'subject': 'Example Subject & Symbols are allowed!',
                      // }),
                    );
                    if (await canLaunchUrl(emailLaunchUri)) {
                      await launchUrl(
                        emailLaunchUri,
                        // webViewConfiguration: const WebViewConfiguration(),
                      );
                    } else {
                      throw Exception('Could not launch $emailLaunchUri');
                    }
                  },
                  leading: const Icon(Icons.feedback_outlined),
                  title: const Text('Feedback'),
                ),
                const Divider(),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, 'about_screen');
                  },
                  leading: const Icon(Icons.info_outline_rounded),
                  title: const Text('About This App'),
                ),
                const Divider(),
                ListTile(
                  onTap: () {
                    setState(() {
                      AzkarBookmarkPrefs.clearAzkarAmharicBookmarks();
                      AzkarBookmarkPrefs.clearAzkarArabicBookmarks();
                      CounterPrefs.clearTotalCount();
                      HadithBookmarkPrefs.clearHadithBookmarks();
                      LockPrefs.clearLockStatus();
                      LockPrefs.clearAutuoThemeStatus();
                      LockPrefs.clearTranslationStatus();
                      LockPrefs.clearVibrateStatus();
                      QuranBookmarkPrefs.clearQuranBookmarks();
                      // textState.clearAllState();
                      myTimer.clearAllState();
                      ReminderPrefs.clearAllStatus();

                      Fluttertoast.showToast(
                          msg: "Settings has been reset",
                          toastLength: Toast.LENGTH_SHORT,
                          fontSize: 20,
                          backgroundColor: Colors.green);
                    });
                  },
                  leading: const Icon(Icons.restart_alt_rounded),
                  title: const Text('Reset Settings'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
