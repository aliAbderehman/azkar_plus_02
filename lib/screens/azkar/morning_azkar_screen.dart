import 'package:azkar_plus/theme/services/translate_prefs.dart';
import 'package:flutter/material.dart';
import 'package:azkar_plus/admob/load_ads.dart';

import 'package:azkar_plus/materials/reusable_popup.dart';
// import 'package:hajj_and_umra_03/screens/azkar/actions_azkar.dart';
import 'package:azkar_plus/screens/azkar/azkar_materials.dart';
import 'package:azkar_plus/screens/azkar/contents/morning_azkar.dart';
import 'package:azkar_plus/screens/tesbih/counter_button.dart';
import 'package:azkar_plus/theme/services/lock_prefs.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:vibration/vibration.dart';

class MorningAzkarScreen extends StatefulWidget {
  const MorningAzkarScreen({super.key});

  @override
  State<MorningAzkarScreen> createState() => _MorningAzkarScreenState();
}

double progressVal = 0;
double sizedHeight = 10;
bool isVibrate = true;
bool isSound = true;

class _MorningAzkarScreenState extends State<MorningAzkarScreen> {
  bool isPressed = false;
  int index = 0;
  int azkIndex = 1;

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
    // timer?.cancel();
    super.dispose();
  }

  bool translate = false;

  @override
  Widget build(BuildContext context) {
    final soundEffect = AudioPlayer();

    return Scaffold(
      appBar: AppBar(
        title: const Text('የጠዋት አዝካር'),
        actions: const [ReusablePopUp()],
      ),
      body: Column(
        children: [
          Row(
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
                counter: morningAzkar[index].counter,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isVibrate = !isVibrate;
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
          Expanded(
            flex: 4,
            child: AzkarCard(
              azkarAr: morningAzkar[index].arabicAzkar,
              azkarAm: TranslatePrefs.getTranslateStatus()!
                  ? morningAzkar[index].amharicTranslation
                  : '',
              counter: (index),
              totalAzkar: morningAzkar.length,
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
                    updateZikr('-');
                  },
                  icn: Icons.fast_rewind_rounded,
                ),
                SmallButton(
                  onPressed: () {
                    azkIndex = morningAzkar[index].counter;
                    updateZikr('+');
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
                      if (isSound) {
                        soundEffect
                            .play(AssetSource('sound/azkar_sound_effect.mp3'));
                      }
                      updateZikr('+');
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }

  void updateZikr(String sens) {
    setState(() {
      if (isVibrate) {
        Vibration.vibrate(duration: 50, amplitude: 200);
      }
      if (sens == '+') {
        if (index == morningAzkar.length - 1) {
          if (azkIndex == morningAzkar[index].counter) {
            index = 0;
            // AzkInterstitialAd.showInterstitialAd();
            Navigator.pop(context);
          } else {
            azkIndex++;
          }
        } else {
          if (azkIndex == morningAzkar[index].counter) {
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
    });
  }
}
