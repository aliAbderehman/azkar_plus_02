import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:azkar_plus/admob/ad_helper.dart';
// import 'package:azkar_plus_01/admob/load_ads.dart';
import 'package:azkar_plus/materials/reusable_popup.dart';
import 'package:provider/provider.dart';
import 'package:smooth_compass/utils/src/compass_ui.dart';
import 'package:smooth_compass/utils/src/widgets/error_widget.dart';
import 'package:vibration/vibration.dart';
// import 'package:flutter/services.dart';

import '../../provider/dark_theme_provider.dart';

class SmoothQiblaCompass extends StatefulWidget {
  const SmoothQiblaCompass({Key? key}) : super(key: key);

  @override
  State<SmoothQiblaCompass> createState() => _SmoothQiblaCompassState();
}

// int index = 0;

class _SmoothQiblaCompassState extends State<SmoothQiblaCompass> {
  bool shouldwe = false;
  bool isQibla = false;
  bool vibrate = true;
  int x = 0;

  void isFound(double angle, double qibla) {
    shouldwe = true;

    if (angle < qibla + 2 && angle > qibla - 2) {
      while (x == 0) {
        Vibration.vibrate(duration: 50);
        x++;
      }

      vibrate = false;

      isQibla = true;
    } else {
      x = 0;
      isQibla = false;
    }
  }

  InterstitialAd? interstitialAd;

  @override
  void initState() {
    // AzkInterstitialAd.createInterstitialAd();
    initBannerAd();

    super.initState();
  }

  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  initBannerAd() {
    _bannerAd = BannerAd(
      // AdHelper.bannerAdUnitId
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );
    _bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    Future.delayed(
        const Duration(
          seconds: 30,
        ), () {
      return 'እባክዎ መሬት ወይም ጠፍጣፋ ቦታ ላይ ያስቅምጡት';
    });
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: Colors.transparent,
        title: const Text("ቂብላ"),
        actions: const [ReusablePopUp()],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          opacity: 150,
          image: themeState.getDarkTheme
              ? const AssetImage('assets/images/geo_bg_light.png')
              : const AssetImage('assets/images/geo_bg_dark.png'),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Center(
                child: Stack(
                  children: [
                    SmoothCompass(
                      // errorDecoration: ErrorDecoration(spaceBetween: 0),
                      // rotationSpeed: 700,
                      isQiblahCompass: true,
                      compassBuilder: (context, snapshot, child) {
                        // print(snapshot?.data?.qiblahOffset);

                        isFound(snapshot?.data?.angle ?? 0,
                            snapshot?.data?.qiblahOffset ?? 0);

                        return Stack(
                          children: [
                            AnimatedRotation(
                              turns: snapshot?.data?.turns ?? 0 / 360,
                              duration: const Duration(milliseconds: 400),
                              child: SizedBox(
                                height: 350,
                                width: 350,
                                child: Stack(
                                  children: [
                                    //put your compass here
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      right: 0,
                                      bottom: 0,
                                      child: themeState.getDarkTheme
                                          ? Image.asset(
                                              'assets/qibla/compass_golden.png',
                                              fit: BoxFit.fill,
                                            )
                                          : Image.asset(
                                              'assets/qibla/compass_01.png',
                                              fit: BoxFit.fill,
                                            ),
                                    ),

                                    //put your qiblah needle here
                                    Positioned(
                                      top: 20,
                                      left: 0,
                                      right: 0,
                                      bottom: 20,
                                      child: AnimatedRotation(
                                        turns: (snapshot?.data?.qiblahOffset ??
                                                0) /
                                            360,
                                        duration:
                                            const Duration(milliseconds: 400),
                                        child: themeState.getDarkTheme
                                            ? Image.asset(
                                                'assets/qibla/qibla_gold_02.png',
                                                fit: BoxFit.fitHeight,
                                              )
                                            : Image.asset(
                                                'assets/qibla/qibla.png',
                                                fit: BoxFit.fitHeight,
                                              ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 20,
                              left: 0,
                              right: 0,
                              bottom: 20,
                              child: SizedBox(
                                height: 100.0,
                                width: 100.0,
                                // turns: (snapshot?.data?.qiblahOffset ?? 0) / 360,
                                // duration: const Duration(milliseconds: 400),
                                child: isQibla
                                    ? const Image(
                                        image: AssetImage(
                                          'assets/qibla/needle_short_green.png',
                                          // fit: BoxFit.fitHeight,
                                        ),
                                      )
                                    : const Image(
                                        image: AssetImage(
                                          'assets/qibla/needle_short_02.png',
                                          // fit: BoxFit.fitHeight,
                                        ),
                                      ),
                              ),
                            ),
                            Text(
                              '${snapshot?.data?.angle.toStringAsFixed(2) ?? 0}',
                              style: TextStyle(
                                  color: isQibla ? Colors.green : Colors.black),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            // Text(
                            // '${snapshot?.data?.qiblahOffset.toStringAsFixed(2) ?? 0}')
                            //4.81
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            if (_isBannerAdReady)
              SizedBox(
                width: double.infinity,
                height: 50,
                child: AdWidget(ad: _bannerAd),
              ),
          ],
        ),
      ),
    );
  }
}
