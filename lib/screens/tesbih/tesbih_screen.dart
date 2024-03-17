import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:azkar_plus/screens/tesbih/tesbih_popUp.dart';
import 'package:azkar_plus/theme/services/lock_prefs.dart';
import 'package:provider/provider.dart';
import 'actions.dart';

import '../../provider/dark_theme_provider.dart';
import 'counter_button.dart';

int totalCount = 0;
int counter = 0;
bool locked = false;
bool vibrate = true;

class TesbihScreen extends StatefulWidget {
  const TesbihScreen({super.key});

  @override
  State<TesbihScreen> createState() => _TesbihScreenState();
}

class _TesbihScreenState extends State<TesbihScreen> {
  // bool isDarkMode = true;
  OverlayEntry? entry;
  Offset? offset;

  // late BannerAd _bannerAd;
  // bool _isBannerAdReady = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showOverlay();
    });
    totalCount = CounterPrefsActions().getTotalCount();
    locked = LockPrefs.getLockStatus()!;
    vibrate = LockPrefs.getVibrateStatus()!;
    // AzkInterstitialAd.createInterstitialAd();
    //  AzkRewardedAd.createRewardedAd();
    // _loadBannerAd();

    super.initState();
  }

  // void _loadBannerAd() {
  //   _bannerAd = BannerAd(
  //     adUnitId: AdHelper.bannerAdUnitId,
  //     request: AdRequest(),
  //     size: AdSize.banner,
  //     listener: BannerAdListener(
  //       onAdClicked: (_) {
  //         setState(() {
  //           _isBannerAdReady = true;
  //         });
  //       },
  //       onAdFailedToLoad: (ad, error) {
  //         _isBannerAdReady = false;
  //         ad.dispose();
  //       },
  //     ),
  //   );
  // }

  @override
  void dispose() {
    CounterPrefsActions().addTotalCount();
    LockPrefs.setLockStatus(locked);
    LockPrefs.setVibrateStatus(vibrate);

    super.dispose();
    hideOverlay();
  }

  bool adFlag = false;

  @override
  Widget build(BuildContext context) {
    // if (AzkRewardedAd.isRewardShowed == false) {
    //   AzkRewardedAd.showRewardedAd();
    //   // adFlag = true;
    // }
    final themeState = Provider.of<DarkThemeProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        hideOverlay();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                hideOverlay();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          title: const Text('ተስቢህ'),
          actions: [
            TesbihPopUp(
              stateSetter: () {
                setState(() {
                  CounterPrefsActions().resetTotalCount();
                  totalCount = 0;
                  counter = 0;
                });
              },
              dispo: hideOverlay,
              rebuild: showOverlay,
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              opacity: 200,
              image: themeState.getDarkTheme
                  ? const AssetImage('assets/images/geo_bg_light.png')
                  : const AssetImage('assets/images/geo_bg_dark.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Total :',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    Expanded(
                      // flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          // '12345865600694857495734989875973459375',
                          totalCount.toString(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 0, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        locked = !locked;
                                      });
                                    },
                                    icon: locked
                                        ? const FaIcon(FontAwesomeIcons.lock)
                                        : const FaIcon(
                                            FontAwesomeIcons.lockOpen)),
                              )),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        vibrate = !vibrate;
                                      });
                                    },
                                    icon: vibrate
                                        ? const Image(
                                            image: AssetImage(
                                                'assets/qibla/vibrate.png'))
                                        : const Image(
                                            image: AssetImage(
                                                'assets/qibla/vibrate_off.png'))),
                              )),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: MorphiOpj(
                              counterCount: () {
                                CounterPrefsActions().addTotalCount();

                                // resets the counter value
                                setState(() {
                                  counter = 0;
                                });
                              },
                              isVibrate: false,
                            ),
                          ),
                          Text(
                            'Reset',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    // flex: 6,
                    child: Center(
                      child: Text(
                        // '874239472749123741ggggggggggggggggggggggggggggg9479732781',
                        counter.toString(),
                        style: TextStyle(
                          fontSize: 90,
                          color: themeState.getDarkTheme
                              ? const Color.fromARGB(255, 131, 127, 122)
                              : const Color.fromARGB(255, 130, 130, 130),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // const Expanded(
              //   child: SizedBox(
              //     height: 10,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  void showOverlay() {
    offset = Offset(MediaQuery.of(context).size.width * 0.25,
        MediaQuery.of(context).size.height * 0.6);
    entry = OverlayEntry(
      builder: (context) => Positioned(
        left: offset!.dx,
        top: offset!.dy,
        child: GestureDetector(
          onPanUpdate: (details) {
            if (!locked) {
              offset = offset! + details.delta;
            }
            entry!.markNeedsBuild();
          },
          child: MorphiOpj(
              isVibrate: vibrate,
              counterCount: () {
                //updates both counter and total counter value
                setState(() {
                  counter = counter + 1;
                  totalCount = totalCount + 1;
                });
              }),
        ),
      ),
    );

    final overlay = Overlay.of(context);
    overlay.insert(entry!);
  }

  void hideOverlay() {
    entry?.remove();
    entry = null;
  }
}

// <Widget>[
//           ReusablePopUp(
//             dispo: hideOverlay,
//             rebuild: showOverlay,
//           )
