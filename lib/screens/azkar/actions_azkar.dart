import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

void updateZikr(
    {required String sens,
    required bool isVibrate,
    required int index,
    required int length,
    required int azkIndex,
    counter,
    required BuildContext context}) {
  if (sens == '+') {
    if (index == length - 1) {
      if (azkIndex == counter) {
        index = 0;

        Navigator.pop(context);
      } else {
        azkIndex++;
      }
    } else {
      if (azkIndex == counter) {
        index++;
        if (isVibrate) {
          Vibration.vibrate(duration: 50, amplitude: 200);
        }

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
