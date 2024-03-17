import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:azkar_plus/admob/ad_helper.dart';

import '../materials/morphis_button_rect.dart';
import '../materials/reusable_popup.dart';

class AzkarScreen extends StatefulWidget {
  const AzkarScreen({super.key});

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('አዝካር'),
        actions: const <Widget>[ReusablePopUp()],
      ),
      bottomNavigationBar: SizedBox(
        height: _bannerAd.size.height.toDouble(),
        width: _bannerAd.size.width.toDouble(),
        child: _isBannerAdReady ? AdWidget(ad: _bannerAd) : null,
      ),
      body: ListView(
        children: const [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: AzkarButton(
                      imgPath: 'assets/images/morning_01.png',
                      lable: 'የጠዋት አዝካር',
                      navigateTo: 'morning_azkar_screen'),
                ),
                Expanded(
                  child: AzkarButton(
                      imgPath: 'assets/images/night_01.png',
                      lable: 'የምሽት አዝካር',
                      navigateTo: 'evening_azkar_screen'),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: AzkarButton(
                      imgPath: 'assets/images/after_salah_01.png',
                      lable: 'ከሰላት በኋላ',
                      navigateTo: 'after_salah_azkar_screen'),
                ),
                Expanded(
                  child: AzkarButton(
                      imgPath: 'assets/images/before_bed_01.png',
                      lable: 'ከመኝታ በፊት',
                      navigateTo: 'before_bed_azkar_screen'),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: AzkarButton(
                      imgPath: 'assets/images/after_bed_01.png',
                      lable: 'ከመኝታ ሲነቁ',
                      navigateTo: 'when_Waking_up_azkar_screen'),
                ),
                Expanded(child: SizedBox())
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AzkarButton extends StatelessWidget {
  const AzkarButton({
    super.key,
    required this.imgPath,
    required this.lable,
    required this.navigateTo,
    // required this.onPressed,
  });

  final String imgPath;
  final String lable;
  final String navigateTo;

  final double iconHeight = 90.0;
  final double iconWidth = 90.0;

  // final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MorphisButtonRect(
        alignment: Alignment.center,
        icon: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 3,
              child: Image(
                image: AssetImage(imgPath),
                // fit: BoxFit.fill,
                height: iconHeight,
                width: iconWidth,
              ),
            ),
            const Divider(),
            Lable(lable: lable)
          ],
        ),
        onPressed: () {
          Navigator.pushNamed(context, navigateTo);
        },
      ),
    );
  }
}

class Lable extends StatelessWidget {
  const Lable({super.key, required this.lable});
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Text(lable, style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
