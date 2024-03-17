// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:azkar_plus/admob/ad_helper.dart';
import 'package:azkar_plus/content_texts/megbiya_text.dart';
import 'package:azkar_plus/screens/hajj/hajj_buttons.dart';

import '../materials/fixed_card.dart';
import '../materials/reusable_popup.dart';

class HajjScreen extends StatefulWidget {
  const HajjScreen({super.key});

  @override
  State<HajjScreen> createState() => _HajjScreenState();
}

class _HajjScreenState extends State<HajjScreen> {
  final iconHeight = 100.0;

  final iconWidth = 100.0;

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
      request: AdRequest(),
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
      bottomNavigationBar: SizedBox(
        height: _bannerAd.size.height.toDouble(),
        width: _bannerAd.size.width.toDouble(),
        child: _isBannerAdReady ? AdWidget(ad: _bannerAd) : null,
      ),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const SliverAppBar(
            actions: <Widget>[ReusablePopUp()],
            snap: true,
            floating: true,
            title: Text('ሃጅ'),
          )
        ],
        body: ListView(
          children: [
            FixedCard(
                title: 'ሃጅ ምንድን ነው?\n',
                content: MegbiyaContent().content.toString()),
            HajjButtons(),
          ],
        ),
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
      padding: const EdgeInsets.all(8.0),
      child: Text(lable, style: Theme.of(context).textTheme.headlineSmall),
    );
  }
}
