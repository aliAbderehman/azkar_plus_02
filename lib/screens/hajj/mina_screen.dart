import 'package:flutter/material.dart';

import '../../materials/fixed_card.dart';
import '../../materials/reusable_popup.dart';
import '../../materials/reusable_sliding_up_panel.dart';

class Mina extends StatelessWidget {
  const Mina({super.key});

  @override
  Widget build(BuildContext context) {
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.63;
    final panelHeightOpened = MediaQuery.of(context).size.height - 80;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ሚና'),
        actions: const <Widget>[ReusablePopUp()],
      ),
      body: ReusableSlidingUpPanel(
        panelHeightClosed: panelHeightClosed,
        panelHeightOpened: panelHeightOpened,
        contents: const [
          FixedCard(
              title: 'ሚና \n',
              content:
                  'በ ዙልሂጃ 8ኛ ቀን የ ሃጅ ትግበራዎች ይጀምራሉ። ተጓዦቹ ኢህራም አድርገው ወደ ሚና ያቀናሉ። በሚናም የ ዙህር፣ አሱር፣ መግሪብ፣ ኢሻ እና የፈጅር ሶላትን በሚና ይሰግዳሉ'),
          FixedCard(
            content:
                'ሚና ላይ የተለያዩ ኢባዳዎችን ማድረግ ይወደዳል \n- ቁራን ማንበብ\n- ዚክሮችን ማለት\n- ዱዓ ማድረግ',
          ),
          FixedCard(
            content: 'ምሽቱን በሚና አሳልፍው ለ9ኛው ቅን ለ አረፋ ጉዞ ይዘጋጃሉ',
          ),
        ],
        imgPath: 'assets/images/bg_image/mina_bg.png',
        color: const Color(0xFF003665),
      ),
    );
  }
}
