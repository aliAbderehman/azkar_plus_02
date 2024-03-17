import 'dart:io';

import 'package:azkar_plus/notificationservice.dart';
import 'package:azkar_plus/provider/timer_provider.dart';
import 'package:azkar_plus/theme/services/reminder_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:azkar_plus/materials/menu_item.dart';
import 'package:azkar_plus/materials/overlay_builder.dart';

import 'package:provider/provider.dart';
// import 'package:timezone/data/latest.dart' as tz;

import '../materials/custom_slide_drawer.dart';
import '../provider/dark_theme_provider.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    return CustomSlideDrawer(themeState: themeState);
  }
}

var ovLay = const AdOverlay();

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  NotificationService ns = NotificationService();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _isAndroidPermissionGranted();
    _requestPermissions();
  }

  bool _notificationsEnabled = false;
  Future<void> _requestPermissions() async {
    if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation = ns
          .flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();

      final bool? grantedNotificationPermission =
          await androidImplementation?.requestPermission();
      setState(() {
        _notificationsEnabled = grantedNotificationPermission ?? false;
      });
    }
  }

  Future<void> _isAndroidPermissionGranted() async {
    if (Platform.isAndroid) {
      final bool granted = await ns.flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>()
              ?.areNotificationsEnabled() ??
          false;

      setState(() {
        _notificationsEnabled = granted;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final timer = Provider.of<TimerProvider>(context);
    NotificationService ns = NotificationService();

    if (ReminderPrefs.getReminderStatus()!) {
      ns.scheduleDailyTenAMNotification(timer: timer);
    }

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                ZoomDrawer.of(context)!.toggle();
              },
              icon: const Icon(Icons.menu)),
          title: const Text('አዝካር ፕላስ አማርኛ'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings_outlined),
              onPressed: () {
                Navigator.pushNamed(context, 'settings_screen');
              },
            )
          ],
        ),
        body: const MenuItemBuilder());
  }
}
