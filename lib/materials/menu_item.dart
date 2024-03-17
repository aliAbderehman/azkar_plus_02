import 'dart:math';

import 'package:azkar_plus/admob/ad_helper.dart';
import 'package:azkar_plus/resource/dua_quran_am_list.dart';
import 'package:azkar_plus/resource/dua_quran_ar_list%20.dart';
import 'package:azkar_plus/resource/dua_quran_index01.dart';
import 'package:azkar_plus/screens/dua/Dua_buttons.dart';
import 'package:azkar_plus/theme/consts/them_data.dart';
import 'package:azkar_plus/theme/services/translate_prefs.dart';
import 'package:flutter/material.dart';
import 'package:azkar_plus/admob/load_ads.dart';
import 'package:azkar_plus/materials/morphis_button_circle.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../provider/dark_theme_provider.dart';
import 'package:azkar_plus/resource/dua_sunna_am.dart';
import 'package:azkar_plus/resource/dua_sunna_ar_list.dart';

class MenuItemBuilder extends StatefulWidget {
  const MenuItemBuilder({super.key});

  @override
  State<MenuItemBuilder> createState() => _MenuItemBuilderState();
}

class _MenuItemBuilderState extends State<MenuItemBuilder> {
  final _controller = PageController();
  @override
  void initState() {
    // final themeState = Provider.of<DarkThemeProvider>(context);

    // AzkRewardedAd.createRewardedAd();
    AzkInterstitialAd.createInterstitialAd();
    // loadAd(themeState);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    Random rand = Random();
    int randomIndexHadith = rand.nextInt(duaQuranAr.length);
    int randomIndexQuran = rand.nextInt(duaQuranAr.length);

    // Random random = Random.secure();

    Future<void> refresh() async {
      setState(() {
        randomIndexHadith = rand.nextInt(duaQuranAr.length);
        randomIndexQuran = rand.nextInt(duaQuranAr.length);
      });

      return;
    }

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              opacity: 230,
              image: themeState.getDarkTheme
                  ? const AssetImage('assets/images/geo_bg_light.png')
                  : const AssetImage('assets/images/geo_bg_dark.png'),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: refresh,
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      // width: MediaQuery.of(context).size.width,
                      height: 150,
                      child: PageView(
                        controller: _controller,
                        // scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MorphisButtonCircle(
                                icnImage: 'assets/images/azkar.png',
                                lable: 'አዝካር',
                                onPressed: () {
                                  // AzkInterstitialAd.showInterstitialAd();
                                  Navigator.pushNamed(context, 'azkar_screen');
                                },
                              ),
                              MorphisButtonCircle(
                                icnImage: themeState.getDarkTheme
                                    ? 'assets/images/qibla_gold_4.png'
                                    : 'assets/images/qibla_silver_5.png',
                                lable: 'ቂብላ',
                                onPressed: () {
                                  AzkInterstitialAd.showInterstitialAd();

                                  Navigator.pushNamed(
                                      context, 'smooth_qibla_screen');
                                },
                              ),
                              MorphisButtonCircle(
                                icnImage: 'assets/images/tesbih.png',
                                lable: 'ተስቢህ',
                                onPressed: () {
                                  AzkInterstitialAd.showInterstitialAd();

                                  Navigator.pushNamed(context, 'tesbih_screen');
                                },
                              ),
                              MorphisButtonCircle(
                                icnImage: 'assets/images/dua.png',
                                lable: 'ዱዓ',
                                onPressed: () {
                                  // AzkInterstitialAd.showInterstitialAd();
                                  Navigator.pushNamed(context, 'dua_screen');
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MorphisButtonCircle(
                                icnImage: 'assets/images/hajj.png',
                                lable: 'ሃጅ',
                                onPressed: () {
                                  Navigator.pushNamed(context, 'hajj_screen');
                                },
                              ),
                              MorphisButtonCircle(
                                icnImage: 'assets/images/umra.png',
                                lable: 'ዑምራ',
                                onPressed: () {
                                  Navigator.pushNamed(context, 'umra_screen');
                                },
                              ),
                              MorphisButtonCircle(
                                icnImage:
                                    'assets/images/bookmark_yellow_02.png',
                                lable: 'Saved',
                                onPressed: () {
                                  Navigator.pushNamed(context, 'faq_screen');
                                },
                              ),
                              const SizedBox(
                                width: 90,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        onDotClicked: (index) {
                          _controller.nextPage(
                              duration: const Duration(microseconds: 1000),
                              curve: Curves.decelerate);
                        },
                        controller: _controller,
                        count: 2,
                        effect: JumpingDotEffect(
                            dotColor:
                                Styles.scaffoldColor(themeState.getDarkTheme),
                            activeDotColor: Colors.amber,
                            // Styles.activeColor(themeState.getDarkTheme),
                            dotHeight: 10,
                            dotWidth: 10,
                            verticalOffset: 10),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 200,
                            width: 200,
                            child: DuaQuranButton(
                              themeState: themeState,
                              textSize: 25,
                              text: 'ዱዓ ከቁርዓን',
                              imageSize: 150,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 9,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 200,
                            width: 200,
                            child: DuaHadithButton(
                              themeState: themeState,
                              size: 25,
                              text: 'ዱዓ ከሃዲስ',
                              imageSize: 150,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    AzkNative(themeState: themeState),
                    const SizedBox(
                      height: 15,
                    ),
                    FeedCard(
                      randomIndex: randomIndexHadith,
                      txt1: duaHadithAr[randomIndexHadith],
                      txt2: duaHadithAm[randomIndexHadith],
                      index: '',
                      isDarkTheme: themeState.getDarkTheme,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    FeedCard(
                      randomIndex: randomIndexHadith,
                      txt1: duaQuranAr[randomIndexQuran],
                      txt2: duaQuranAm[randomIndexQuran],
                      index: duaQuranIndex[randomIndexQuran],
                      isDarkTheme: themeState.getDarkTheme,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeedCard extends StatelessWidget {
  const FeedCard({
    super.key,
    required this.randomIndex,
    required this.txt1,
    required this.txt2,
    required this.index,
    required this.isDarkTheme,
  });

  final int randomIndex;
  final String txt1, txt2;
  final String index;
  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Styles.scaffoldColor(isDarkTheme),
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              txt1,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  fontFamily: 'Uthman',
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Styles.textColor(isDarkTheme)),
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
              TranslatePrefs.getTranslateStatus()! ? txt2 : '',
              style: TextStyle(
                  fontFamily: 'Nyala',
                  fontSize: 22,
                  color: Styles.textColor(isDarkTheme)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              index,
              style: const TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class AzkNative extends StatefulWidget {
  const AzkNative({super.key, required this.themeState});
  final DarkThemeProvider themeState;

  @override
  State<AzkNative> createState() => _AzkNativeState();
}

class _AzkNativeState extends State<AzkNative> {
  @override
  void initState() {
    loadAd();
    super.initState();
  }

  NativeAd? nativeAd;
  bool _nativeAdIsLoaded = false;

  void loadAd() {
    nativeAd = NativeAd(
        nativeAdOptions: NativeAdOptions(
            // adChoicesPlacement: AdChoicesPlacement.top,
            requestCustomMuteThisAd: true,
            videoOptions: VideoOptions(
              clickToExpandRequested: true,
              customControlsRequested: true,
              startMuted: true,
            )),
        adUnitId: AdHelper.nativeAdUnitId,
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            print(
                '$NativeAd loadjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjed.');
            setState(() {
              _nativeAdIsLoaded = true;
            });
          },
          onAdFailedToLoad: (ad, error) {
            // Dispose the ad here to free resources.
            print(
                '$NativeAd failed to nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnload: $error');
            _nativeAdIsLoaded = false;
            // ad.dispose();
            // loadAd();
          },
        ),
        request: const AdRequest(),
        // Styling
        nativeTemplateStyle:
            Styles.nativeTemplateStyle(widget.themeState.getDarkTheme))
      ..load();
  }

  @override
  Widget build(BuildContext context) {
    // Medium template
    final adContainer = Card(
      color: Styles.scaffoldColor(widget.themeState.getDarkTheme),
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 320, // minimum recommended width
          minHeight: 320, // minimum recommended height
          maxWidth: 400,
          maxHeight: 400,
        ),
        // height: 320,
        child: AdWidget(ad: nativeAd!),
      ),
    );
    return _nativeAdIsLoaded ? adContainer : const SizedBox();
  }
}
