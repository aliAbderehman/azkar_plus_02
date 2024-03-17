import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:azkar_plus/admob/ad_helper.dart';
import 'package:provider/provider.dart';

import '../materials/reusable_popup.dart';
import '../provider/dark_theme_provider.dart';
import 'dua/Dua_buttons.dart';

class DuaScreen extends StatefulWidget {
  const DuaScreen({super.key});

  @override
  State<DuaScreen> createState() => _DuaScreenState();
}

class _DuaScreenState extends State<DuaScreen> {
  @override
  void initState() {
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('ዱዓ'),
        actions: const <Widget>[ReusablePopUp()],
      ),
      bottomNavigationBar: SizedBox(
        height: _bannerAd.size.height.toDouble(),
        width: _bannerAd.size.width.toDouble(),
        child: _isBannerAdReady ? AdWidget(ad: _bannerAd) : null,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: DuaQuranButton(
                themeState: themeState,
                textSize: 35,
                text: 'ከቁርዓን የተውጣጡ\nዱዓዎች',
                imageSize: 200,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: DuaHadithButton(
                themeState: themeState,
                size: 35,
                text: 'ከሃዲስ የተውጣጡ\nዱዓዎች',
                imageSize: 200,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
