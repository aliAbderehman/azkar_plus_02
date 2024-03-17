import 'package:flutter/material.dart';
import 'package:azkar_plus/materials/cards_action_buttons.dart';
import 'package:azkar_plus/materials/custom_styles.dart';
import 'package:azkar_plus/materials/morph_txt_dispay.dart';
import 'package:azkar_plus/screens/tesbih/counter_button.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class StatText extends StatelessWidget {
  const StatText({
    super.key,
    required this.azkIndex,
    required this.index,
    required this.counter,
  });

  final int azkIndex;
  final int index;
  final int counter;

  @override
  Widget build(BuildContext context) {
    return MorphTxtDisplay(
      displayText: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          '$azkIndex/$counter',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

double smallButtonSize = 60;
double smallButtonIconSize = 25;

class SmallButton extends StatelessWidget {
  const SmallButton({super.key, required this.onPressed, required this.icn});
  final Function onPressed;
  final IconData icn;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: MorphiOpj(
          height: smallButtonSize,
          width: smallButtonSize,
          buttunLable: Icon(
            icn,
            size: smallButtonIconSize,
          ),
          isVibrate: false,
          counterCount: onPressed,
        ));
  }
}

class AzkarCard extends StatefulWidget {
  const AzkarCard(
      {super.key,
      required this.azkarAr,
      required this.azkarAm,
      required this.counter,
      required this.totalAzkar,
      required this.subCounter});
  final String azkarAr;
  final String azkarAm;
  final int counter;
  final int totalAzkar;
  final int subCounter;

  @override
  State<AzkarCard> createState() => _AzkarCardState();
}

List<String> azkarBookmarks = [];

class _AzkarCardState extends State<AzkarCard> {
  // bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return MorphTxtDisplay(
      // margin: EdgeInsets.all(8.0),
      displayText: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: ListView(
                key: ValueKey<List>([widget.subCounter, widget.counter]),
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Text(
                    widget.azkarAr,
                    // key: ValueKey(widget.counter),
                    style: kArTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  // ),
                  const Divider(height: 40),
                  Text(
                    widget.azkarAm,
                    style: kAmTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardActionButtons(
                  // isPressed: isPressed,
                  tx1: widget.azkarAr,
                  tx2: widget.azkarAm,
                  co: widget.counter,
                  // saveBookmark: addBookmark,
                  share: () {},
                ),
                Stack(
                  children: [
                    CircularPercentIndicator(
                      percent: (widget.counter / widget.totalAzkar),
                      radius: 33,
                      // animation: true,
                      lineWidth: 7.0,
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.green,
                      center: CircleAvatar(
                          radius: 25,
                          child: Text(
                            (widget.counter + 1).toString(),
                            style: const TextStyle(fontSize: 20),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget vibrateButton(bool isVibrate) {
  return isVibrate
      ? const Image(
          image: AssetImage('assets/qibla/vibrate.png'),
          height: 25,
          width: 25,
        )
      : const Image(
          image: AssetImage('assets/qibla/vibrate_off.png'),
          height: 25,
          width: 25,
        );
}
