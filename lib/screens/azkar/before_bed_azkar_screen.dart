import 'package:audioplayers/audioplayers.dart';
import 'package:azkar_plus/theme/services/translate_prefs.dart';
import 'package:flutter/material.dart';
import 'package:azkar_plus/admob/load_ads.dart';
import 'package:azkar_plus/materials/reusable_popup.dart';
import 'package:azkar_plus/screens/azkar/contents/azkar_before_bed.dart';
import 'package:azkar_plus/screens/tesbih/counter_button.dart';
import 'package:azkar_plus/theme/services/lock_prefs.dart';
import 'package:vibration/vibration.dart';

import 'azkar_materials.dart';

class BeforeBedAzkarScreen extends StatefulWidget {
  const BeforeBedAzkarScreen({super.key});

  @override
  State<BeforeBedAzkarScreen> createState() => _BeforeBedAzkarScreenState();
}

int index = 0;
int azkIndex = 1;
double progressVal = 0;
double sizedHeight = 10;
double smallButtonSize = 60;
double smallButtonIconSize = 25;
bool isVibrate = true;
bool isSound = true;

class _BeforeBedAzkarScreenState extends State<BeforeBedAzkarScreen> {
  // const MorningAzkarScreen({super.key});

  void updateZikr(String sens, bool isVibrate) {
    if (isVibrate) {
      Vibration.vibrate(duration: 50, amplitude: 200);
    }
    if (sens == '+') {
      if (index == beforeBedAzkar.length - 1) {
        if (azkIndex == beforeBedAzkar[index].counter) {
          index = 0;
          // AzkInterstitialAd.showInterstitialAd();

          Navigator.pop(context);
        } else {
          azkIndex++;
        }
      } else {
        if (azkIndex == beforeBedAzkar[index].counter) {
          index++;

          azkIndex = 1;
        } else {
          azkIndex++;
        }
      }
    }
    if (sens == '-') {
      if (index > 0) {
        index--;
        azkIndex = 1;
      } else {
        index = 0;
        // azkIndex = 1;
      }
    }
  }

  @override
  void initState() {
    isVibrate = LockPrefs.getVibrateStatus()!;
    AzkInterstitialAd.createInterstitialAd();

    super.initState();
  }

  @override
  void dispose() {
    LockPrefs.setVibrateStatus(isVibrate);
    AzkInterstitialAd.showInterstitialAd();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final soundEffect = AudioPlayer();

    return Scaffold(
      appBar: AppBar(
        title: const Text('ከመኝታ በፊት'),
        actions: const [ReusablePopUp()],
      ),
      body: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          index = 0;
                          azkIndex = 1;
                        });
                      },
                      icon: const Icon(Icons.refresh_rounded)),
                ],
              )),
              StatText(
                azkIndex: azkIndex,
                index: index,
                counter: beforeBedAzkar[index].counter,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isVibrate = !isVibrate;
                          // LockPrefs.setVibrateStatus(isVibrate);
                        });
                      },
                      icon: vibrateButton(isVibrate),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            isSound = !isSound;
                          });
                        },
                        icon:
                            Icon(isSound ? Icons.volume_up : Icons.volume_off))
                  ],
                ),
              ),
            ],
          ),
          // LinearProgressIndicator(
          //   value: 0.5,
          // ),
          Expanded(
            flex: 4,
            child: AzkarCard(
              azkarAr: beforeBedAzkar[index].arabicAzkar,
              azkarAm: TranslatePrefs.getTranslateStatus()!
                  ? beforeBedAzkar[index].amharicTranslation
                  : '',
              counter: (index),
              totalAzkar: beforeBedAzkar.length,
              subCounter: azkIndex,
            ),
          ),
          SizedBox(
            height: sizedHeight,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SmallButton(
                  onPressed: () {
                    setState(() {
                      updateZikr('-', isVibrate);
                    });
                  },
                  icn: Icons.fast_rewind_rounded,
                ),
                SmallButton(
                  onPressed: () {
                    setState(() {
                      azkIndex = beforeBedAzkar[index].counter;
                      updateZikr('+', isVibrate);
                    });
                    azkIndex = 1;
                  },
                  icn: Icons.fast_forward_rounded,
                ),
                MorphiOpj(
                    height: 110,
                    width: 110,
                    buttunLable: const Icon(
                      Icons.arrow_circle_right_outlined,
                      size: 50,
                    ),
                    isVibrate: false,
                    counterCount: () {
                      setState(() {
                        if (isSound) {
                          soundEffect.play(
                              AssetSource('sound/azkar_sound_effect.mp3'));
                        }
                        updateZikr('+', isVibrate);
                      });
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
