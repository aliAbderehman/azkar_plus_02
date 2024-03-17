import 'package:flutter/material.dart';

import '../../materials/fixed_card.dart';
import '../../materials/reusable_popup.dart';
import '../../materials/reusable_sliding_up_panel.dart';

class Hadi extends StatelessWidget {
  const Hadi({super.key});

  @override
  Widget build(BuildContext context) {
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.63;
    final panelHeightOpened = MediaQuery.of(context).size.height - 80;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ሃድይ'),
        actions: const <Widget>[ReusablePopUp()],
      ),
      body: ReusableSlidingUpPanel(
        panelHeightClosed: panelHeightClosed,
        panelHeightOpened: panelHeightOpened,
        contents: const [
          FixedCard(
            content:
                'ሃድይ የ እርድ መስዋት ሲሆን ሃጅ አል-ቂራን እና ሃጅ አል-ተመቱዕ የሚፈጽሙ ተጓዦች ሃይድ ማድረግ ግዴታ ይሆንባቸዋል',
          )
        ],
        imgPath: 'assets/images/bg_image/hadi_bg.png',
        color: const Color(0xFF003665),
      ),
    );
  }
}
