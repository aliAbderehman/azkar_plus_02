import 'package:azkar_plus/provider/dark_theme_provider.dart';
import 'package:azkar_plus/theme/consts/them_data.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:azkar_plus/admob/ad_helper.dart';

class AzkBannerAd {
  static late BannerAd bannerAd;
  static bool isBannerAdReady = false;

  static void loadBannerAd() {
    bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          // setState(() {
          isBannerAdReady = true;
          // });
        },
        onAdFailedToLoad: (ad, error) {
          isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );

    bannerAd.load();
  }
}

class AzkInterstitialAd {
  static InterstitialAd? interstitialAd;

  static void createInterstitialAd() {
    int numInterstitialLoadAttempts = 0;

    InterstitialAd.load(
      adUnitId: AdHelper.interstialAdUnitId,
      request: const AdRequest(),
      adLoadCallback:
          InterstitialAdLoadCallback(onAdLoaded: (InterstitialAd ad) {
        interstitialAd = ad;
        numInterstitialLoadAttempts = 0;
        interstitialAd!.setImmersiveMode(true);
      }, onAdFailedToLoad: (LoadAdError error) {
        numInterstitialLoadAttempts += 1;
        interstitialAd = null;
        if (numInterstitialLoadAttempts < 10) {
          createInterstitialAd();
        }
      }),
    );
  }

  static void showInterstitialAd() {
    if (interstitialAd == null) {
      return;
    }
    interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      // onAdShowedFullScreenContent: (InterstitialAd ad) =>
      // print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        ad.dispose();
        createInterstitialAd();
      },
    );
    interstitialAd!.show();
    interstitialAd = null;
  }
}

class AzkOpenAppAd {
  static AppOpenAd? openAd;
  static Future<void> loadOpenAd() async {
    await AppOpenAd.load(
        adUnitId: AdHelper.appOpenAdUnitId,
        request: const AdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(
            onAdLoaded: (ad) {
              openAd = ad;
              openAd!.show();
            },
            onAdFailedToLoad: (error) {}),
        orientation: AppOpenAd.orientationPortrait);
  }

  static void showOpenAd() {
    if (openAd == null) {
      loadOpenAd();
      return;
    }
    openAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (ad) {},
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          openAd = null;
          loadOpenAd();
        },
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          openAd = null;
          loadOpenAd();
        });

    openAd?.show();
  }
}

class ConColors {
  ConColors({
    required this.themeState,
  });
  final DarkThemeProvider themeState;
  Color getThem() {
    Color conColor = themeState.getDarkTheme ? Colors.black : Colors.white;
    return conColor;
  }
}


// class AzkarNativeAd extends StatefulWidget {
//   const AzkarNativeAd({super.key, required this.isDarkTheme});

//   final bool isDarkTheme;

//   @override
//   State<AzkarNativeAd> createState() => _AzkarNativeAdState();
// }

// class _AzkarNativeAdState extends State<AzkarNativeAd> {
//   NativeAd? nativeAd;
// bool nativeAdIsLoaded = false;

//   void loadAd() {
//     nativeAd = NativeAd(
//         nativeAdOptions: NativeAdOptions(
//             // adChoicesPlacement: AdChoicesPlacement.top,
//             requestCustomMuteThisAd: true,
//             videoOptions: VideoOptions(
//               clickToExpandRequested: true,
//               customControlsRequested: true,
//               startMuted: true,
//             )),
//         adUnitId: AdHelper.nativeAdUnitId,
//         listener: NativeAdListener(
//           onAdLoaded: (ad) {
//             debugPrint('$NativeAd loaded.');
//             setState(() {
//               nativeAdIsLoaded = true;
//             });
//           },
//           onAdFailedToLoad: (ad, error) {
//             // Dispose the ad here to free resources.
//             debugPrint('$NativeAd failed to load: $error');
//             nativeAdIsLoaded = false;
//             // ad.dispose();
//             // loadAd();
//           },
//           //   // Called when a click is recorded for a NativeAd.
//           //   onAdClicked: (ad) {},
//           //   // Called when an impression occurs on the ad.
//           //   onAdImpression: (ad) {},
//           //   // Called when an ad removes an overlay that covers the screen.
//           //   onAdClosed: (ad) {},
//           //   // Called when an ad opens an overlay that covers the screen.
//           //   onAdOpened: (ad) {},
//           //   // For iOS only. Called before dismissing a full screen view
//           //   onAdWillDismissScreen: (ad) {},
//           //   // Called when an ad receives revenue value.
//           //   onPaidEvent: (ad, valueMicros, precision, currencyCode) {},
//         ),
//         request: const AdRequest(),
//         // Styling
//         nativeTemplateStyle: NativeTemplateStyle(
//             // Required: Choose a template.
//             templateType: TemplateType.medium,
//             // Optional: Customize the ad's style.
//             mainBackgroundColor: Styles.scaffoldColor(widget.isDarkTheme),
//             cornerRadius: 30.0,
//             callToActionTextStyle: NativeTemplateTextStyle(
//                 textColor: Styles.textColor(widget.isDarkTheme),
//                 backgroundColor:
//                     widget.isDarkTheme ? const Color(0xFF946F00) : Colors.green,
//                 style: NativeTemplateFontStyle.monospace,
//                 size: 20.0),
//             primaryTextStyle: NativeTemplateTextStyle(
//                 // textColor: Colors.red,
//                 backgroundColor: Styles.scaffoldColor(widget.isDarkTheme),
//                 style: NativeTemplateFontStyle.italic,
//                 size: 16.0),
//             secondaryTextStyle: NativeTemplateTextStyle(
//                 textColor:
//                     widget.isDarkTheme ? const Color(0xFF946F00) : Colors.green,
//                 backgroundColor: Styles.scaffoldColor(widget.isDarkTheme),
//                 style: NativeTemplateFontStyle.bold,
//                 size: 16.0),
//             tertiaryTextStyle: NativeTemplateTextStyle(
//                 textColor: const Color.fromARGB(255, 148, 148, 148),
//                 backgroundColor: Styles.scaffoldColor(widget.isDarkTheme),
//                 style: NativeTemplateFontStyle.normal,
//                 size: 16.0)))
//       ..load();
//   }

//   @override
//   void initState() {
//     loadAd();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     nativeAd?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Medium template
//     final adContainer = Container(
//       // constraints: const BoxConstraints(
//       //   minWidth: 320, // minimum recommended width
//       //   minHeight: 320, // minimum recommended height
//       //   maxWidth: 400,
//       //   maxHeight: 400,
//       // ),
//       height: 320,
//       child: AdWidget(ad: nativeAd!),
//     );
//     return nativeAdIsLoaded ? adContainer : const SizedBox();
//   }
// }

// class AzkRewardedAd {
  // static RewardedAd? rewardedAd;
  // static bool isRewardShowed = false;

  // static void createRewardedAd() async {
  //   int numRewardedLoadAttempts = 0;

  //   await RewardedAd.load(
  //     adUnitId: AdHelper.rewardedAdUnitId,
  //     request: const AdRequest(),
  //     rewardedAdLoadCallback: RewardedAdLoadCallback(
  //       onAdLoaded: (ad) {
  //         rewardedAd = ad;
  //       },
  //       onAdFailedToLoad: (LoadAdError error) {
  //         numRewardedLoadAttempts += 1;
  //         rewardedAd = null;
  //         if (numRewardedLoadAttempts < 10) {
  //           createRewardedAd();
  //         }
  //       },
  //     ),
  //   );
  // }

  // static void showRewardedAd() async {
  //   // rewardedAd!.show(
  //   //     onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem) {
  //   //   // Reward the user for watching an ad.
  //   // });

  //   if (rewardedAd == null) {
  //     return;
  //   }
  //   rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
  //     onAdShowedFullScreenContent: (RewardedAd ad) {
  //       isRewardShowed = true;
  //     },
  //     onAdDismissedFullScreenContent: (RewardedAd ad) {
  //       ad.dispose();
  //       isRewardShowed = false;
  //       createRewardedAd();
  //     },
  //     onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
  //       ad.dispose();
  //       createRewardedAd();
  //     },
  //   );
  //   rewardedAd!.show(
  //       onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem) {
  //     // Reward the user for watching an ad.
  //   });
  //   rewardedAd = null;
  //   // isRewardShowed = false;
  // }
// }
