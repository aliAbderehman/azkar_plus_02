import 'package:flutter/material.dart';

// import '../screens/hajj_screen.dart';
import '../screens/hajj/hajj_buttons.dart';
import 'morphis_button_rect.dart';

class HajjUmraButton extends StatelessWidget {
  const HajjUmraButton(
      {super.key,
      required this.imgPath,
      required this.lable,
      required this.navigateTo});

  final double iconHeight = 100.0;
  final double iconWidth = 100.0;
  final String imgPath;
  final String lable;
  final String navigateTo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MorphisButtonRect(
        // icnImage: 'assets/images/ihram_05.png',
        icon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(
            image: AssetImage(imgPath),
            height: iconHeight,
            width: iconWidth,
          ),
        ),
        lable: Lable(
          lable: lable,
        ),
        onPressed: () {
          // print('from hajj screen');
          Navigator.pushNamed(context, navigateTo);
        },
        // navigation: 'ihram_screen',
      ),
    );
  }
}
