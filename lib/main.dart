import 'package:azkar_plus/consent/consent.dart';
import 'package:azkar_plus/notificationservice.dart';
import 'package:azkar_plus/provider/timer_provider.dart';
import 'package:azkar_plus/screens/about.dart';
import 'package:azkar_plus/theme/services/reminder_prefs.dart';
import 'package:azkar_plus/theme/services/translate_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:azkar_plus/provider/dark_theme_provider.dart';
import 'package:azkar_plus/provider/text_size_provider.dart';
import 'package:azkar_plus/screens/azkar/after_salah_azkar_screen.dart';
import 'package:azkar_plus/screens/azkar/before_bed_azkar_screen.dart';
import 'package:azkar_plus/screens/azkar/evening_azkar_screen.dart';
import 'package:azkar_plus/screens/azkar/morning_azkar_screen.dart';
import 'package:azkar_plus/screens/azkar/when_waking_up_azkar_screen.dart';
import 'package:azkar_plus/screens/azkar_screen.dart';
import 'package:azkar_plus/screens/bookmarks/azkar_bookmark.dart';
import 'package:azkar_plus/screens/bookmarks/hadith_dua_bookmark.dart';
import 'package:azkar_plus/screens/bookmarks/quran_dua_bookmark.dart';
import 'package:azkar_plus/screens/dua/hadith_dua.dart';
import 'package:azkar_plus/screens/dua/quran_dua.dart';
import 'package:azkar_plus/screens/dua_screen.dart';
import 'package:azkar_plus/screens/bookmark_screen.dart';
import 'package:azkar_plus/screens/hajj/arefa_screen.dart';
import 'package:azkar_plus/screens/hajj/hady_screen.dart';
import 'package:azkar_plus/screens/hajj/halq_screen.dart';
import 'package:azkar_plus/screens/hajj/ihram_screen.dart';
import 'package:azkar_plus/screens/hajj/mina_screen.dart';
import 'package:azkar_plus/screens/hajj/miqat_screen.dart';
import 'package:azkar_plus/screens/hajj/muzdalifa_screen.dart';
import 'package:azkar_plus/screens/hajj/rami_screen.dart';
import 'package:azkar_plus/screens/hajj/sai_screen.dart';
import 'package:azkar_plus/screens/hajj/telbiyah_screen.dart';
import 'package:azkar_plus/screens/hajj/tewaf_screen.dart';
import 'package:azkar_plus/screens/hajj_screen.dart';
import 'package:azkar_plus/screens/home_screen.dart';
import 'package:azkar_plus/screens/megbiya_screen.dart';
import 'package:azkar_plus/screens/qibla/smooth_qibla_compass.dart';
import 'package:azkar_plus/screens/settings_screen.dart';
import 'package:azkar_plus/screens/tesbih/tesbih_screen.dart';
import 'package:azkar_plus/screens/umra/after_tewaf_screen.dart';
import 'package:azkar_plus/screens/umra/tewaf_al_umra_screen.dart';
import 'package:azkar_plus/screens/umra_screen.dart';
import 'package:azkar_plus/theme/services/azkar_bookmark_prefs.dart';
import 'package:azkar_plus/theme/services/hadith_bookmark_prefs.dart';
import 'package:azkar_plus/theme/services/quran_bookmark_prefs.dart';
import 'package:azkar_plus/theme/services/counter_prefs.dart';
import 'package:azkar_plus/theme/services/lock_prefs.dart';
import 'package:provider/provider.dart';
import 'theme/consts/them_data.dart';

const MethodChannel platform =
    MethodChannel('dexterx.dev/azkar_plus_notification');

const String portName = 'notification_send_port';

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HadithBookmarkPrefs.init();
  await QuranBookmarkPrefs.init();
  await CounterPrefs.init();
  await LockPrefs.init();
  await ReminderPrefs.init();
  await TranslatePrefs.init();
  // await TimerPrefs.init();

  await AzkarBookmarkPrefs.init();
  await MobileAds.instance.initialize();
  await NotificationService().initNotification();
  // AwesomeNotifications().initialize();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themechangeProvider = DarkThemeProvider();
  // AutoThemeProvider autothemechangeProvider = AutoThemeProvider();

  TextSizeProvider textSizeProvider = TextSizeProvider();

  TimerProvider timerProvider = TimerProvider();

  void getCurrentAppTheme() async {
    bool autoTheme = LockPrefs.getAutoThemeStatus()!;
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    if (autoTheme) {
      themechangeProvider.setDarkTheme = isDarkMode;
    } else {
      themechangeProvider.setDarkTheme =
          await themechangeProvider.darkThemePrefs.getTheme();
    }
  }

  void getCurrentTextSize() async {
    textSizeProvider.setTextSize =
        await textSizeProvider.textSizePrefs.getTextSize();
  }

  void getCurrentTimer() async {
    timerProvider.setHour = await timerProvider.timerPrefs.getHour();
    timerProvider.setMinute = await timerProvider.timerPrefs.getMinute();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    getCurrentTextSize();
    getCurrentTimer();
    Consent.requestConsent();

    // getCurrentAutoAppTheme();
    // AzkOpenAppAd.loadOpenAd();

    // subscription = FGBGEvents.stream.listen((event) {
    // print(event);

    //   if (event == FGBGType.foreground) {
    //     AppOpenAdManager azkOpenAppAd = AppOpenAdManager()..loadOpenAd();
    //     _appLifecycleReactor =
    //         AppLifecycleReactor(appOpenAdManager: azkOpenAppAd);
    //   }
    // });
    // await NotificationService.scheduleDailyTenAMNotification();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyMultiProvider(
      themechangeProvider: themechangeProvider,
      sizeChangeProvider: textSizeProvider,
      timerProvider: timerProvider,
    );
  }
}

class MyMultiProvider extends StatefulWidget {
  const MyMultiProvider(
      {super.key,
      required this.themechangeProvider,
      required this.sizeChangeProvider,
      required this.timerProvider});

  final DarkThemeProvider themechangeProvider;
  final TextSizeProvider sizeChangeProvider;
  final TimerProvider timerProvider;

  @override
  State<MyMultiProvider> createState() => _MyMultiProviderState();
}

class _MyMultiProviderState extends State<MyMultiProvider> {
// loads the consent form

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // String strDigits(int n) => n.toString().padLeft(2, '0');
    // final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return widget.themechangeProvider;
        }),
        ChangeNotifierProvider(create: (_) {
          return widget.sizeChangeProvider;
        }),
        ChangeNotifierProvider(create: (_) {
          return widget.timerProvider;
        }),
      ],
      child:
          // Consumer<DarkThemeProvider>(builder: (context, themeprovider,  child) {
          Consumer3<DarkThemeProvider, TextSizeProvider, TimerProvider>(builder:
              (context, themeprovider, sizeprovider, timerProvider, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Azkar Plus Amharic',
            theme: Styles.themeData(widget.themechangeProvider.getDarkTheme,
                widget.sizeChangeProvider.getTextSize, context),
            initialRoute: '/',
            routes: {
              '/': (context) => const Menu(),
              'megbiya': (context) => const Megbiya(),
              'hajj_screen': (context) => const HajjScreen(),
              'umra_screen': (context) => const UmraScreen(),
              'dua_screen': (context) => const DuaScreen(),
              'azkar_screen': (context) => const AzkarScreen(),
              'tesbih_screen': (context) => const TesbihScreen(),
              'faq_screen': (context) => const FaqScreen(),
              // 'qibla_screen': (context) => QiblaScreen(),
              'smooth_qibla_screen': (context) => const SmoothQiblaCompass(),
              //hajj screens

              'ihram_screen': (context) => const Ihram(),
              'miqat_screen': (context) => const Miqat(),
              'telbiyah_screen': (context) => const Telbiyah(),
              'tewaf_screen': (context) => const Tewaf(),
              'sai_screen': (context) => const Sai(),
              'mina_screen': (context) => const Mina(),
              'arefa_screen': (context) => const Arefa(),
              'muzdalifa_screen': (context) => const Muzdalifa(),
              'rami_screen': (context) => const Rami(),
              'hadi_screen': (context) => const Hadi(),
              'halq_screen': (context) => const Halq(),
              'settings_screen': (context) => const Settings(),

              //tawaf screens
              'tewaf_al_umra_screen': (context) => const TewafAlUmra(),
              'after_tewaf_screen': (context) => const AfterTewaf(),

              //dua
              'quran_dua': (context) => const QuranDua(),
              'hadith_dua': (context) => const HadithDua(),
              'quran_dua_bookmark': (context) => const QuranDuaBookmarkScreen(),
              'hadith_dua_bookmark': (context) =>
                  const HadithDuaBookmarkScreen(),

              //azkar
              'morning_azkar_screen': (context) => const MorningAzkarScreen(),
              'azkar_bookmark_screen': (context) => const AzkarBookmark(),
              'evening_azkar_screen': (context) => const EveningAzkarScreen(),
              'before_bed_azkar_screen': (context) =>
                  const BeforeBedAzkarScreen(),
              'after_salah_azkar_screen': (context) =>
                  const AfterSalahAzkarScreen(),
              'when_Waking_up_azkar_screen': (context) =>
                  const WhenWakingUpAzkarScreen(),

              'about_screen': (context) => const About(),
            });
      }),
    );
  }
}
