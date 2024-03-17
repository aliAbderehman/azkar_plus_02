import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:azkar_plus/admob/ad_helper.dart';

class AppOpenAdManager {
  static AppOpenAd? openAd;
  static bool _isShowingAd = false;

  final Duration maxCacheDuration = const Duration(hours: 4);
  DateTime? _appOpenLoadTime;

  void loadOpenAd() {
    AppOpenAd.load(
        adUnitId: AdHelper.appOpenAdUnitId,
        request: const AdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(
            onAdLoaded: (ad) {
              _appOpenLoadTime = DateTime.now();
              openAd = ad;
              showOpenAd();
            },
            onAdFailedToLoad: (error) {}),
        orientation: AppOpenAd.orientationPortrait);
  }

  static bool get isAdAvailable {
    return openAd != null;
  }

  void showOpenAd() {
    if (!isAdAvailable) {
      loadOpenAd();
      return;
    }

    if (_isShowingAd) {
      return;
    }
    if (DateTime.now().subtract(maxCacheDuration).isAfter(_appOpenLoadTime!)) {
      openAd!.dispose();
      openAd = null;
      loadOpenAd();
      return;
    }

    openAd!.fullScreenContentCallback =
        FullScreenContentCallback(onAdShowedFullScreenContent: (ad) {
      _isShowingAd = true;
    }, onAdFailedToShowFullScreenContent: (ad, error) {
      _isShowingAd = false;
      ad.dispose();
      openAd = null;
      loadOpenAd();
    }, onAdDismissedFullScreenContent: (ad) {
      _isShowingAd = false;
      ad.dispose();
      openAd = null;
      // loadOpenAd();
    });

    openAd!.show();
  }
}
