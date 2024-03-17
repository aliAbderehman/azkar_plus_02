import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:azkar_plus/admob/ad_helper.dart';
import 'package:azkar_plus/materials/fixed_card.dart';
import 'package:azkar_plus/materials/hajj_umra_button.dart';

import '../materials/reusable_popup.dart';

class UmraScreen extends StatefulWidget {
  const UmraScreen({super.key});

  @override
  State<UmraScreen> createState() => _UmraScreenState();
}

class _UmraScreenState extends State<UmraScreen> {
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
            title: Text('ዑምራ'),
          )
        ],
        body: ListView(
          children: const [
            FixedCard(
              title: 'ዑምራ ምንድን ነው?',
              content:
                  '\nየ አረበኛው ቃል ዑምራ የመጣዉ ኢዒቲማር ከሚለው ሲሆን ትርጉሙም ጉብኝት የሚለውን ይሰጣል። ቢሆንም ዑምራ ወደተቀደሰው የ አላህ ቤት መስጂድ አል~ሃረም የሚደረግ ጉብኝትን ይገልጻል። ዑምራን በማንኛውም ጊዜ መፈጸም ይቻላል።',
            ),
            HajjUmraButton(
                imgPath: 'assets/images/ihram_05.png',
                lable: 'ኢህራም',
                navigateTo: 'ihram_screen'),
            HajjUmraButton(
                imgPath: 'assets/images/tewaf_05.png',
                lable: 'ጠዋፍ አል-ዑምራ',
                navigateTo: 'tewaf_al_umra_screen'),
            // HajjUmraButton(
            //     imgPath: 'assets/images/sai_05.png',
            //     lable: 'ከጠዋፍ በኋላ',
            //     navigateTo: 'after_tewaf_screen'),
            HajjUmraButton(
                imgPath: 'assets/images/sai_05.png',
                lable: 'ሳዕይ',
                navigateTo: 'sai_screen'),
            HajjUmraButton(
                imgPath: 'assets/images/halq_05.png',
                lable: 'ሃልቅ/ተቅሲር',
                navigateTo: 'halq_screen'),
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
    return Text(lable, style: Theme.of(context).textTheme.headlineSmall);
  }
}
