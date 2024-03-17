import 'package:flutter/material.dart';

import '../../materials/fixed_card.dart';
import '../../materials/reusable_popup.dart';
import '../../materials/reusable_sliding_up_panel.dart';

class Muzdalifa extends StatelessWidget {
  const Muzdalifa({super.key});

  @override
  Widget build(BuildContext context) {
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.63;
    final panelHeightOpened = MediaQuery.of(context).size.height - 80;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ሙዝደሊፋህ'),
        actions: const <Widget>[ReusablePopUp()],
      ),
      body: ReusableSlidingUpPanel(
        panelHeightClosed: panelHeightClosed,
        panelHeightOpened: panelHeightOpened,
        contents: const [
          FixedCard(
              content:
                  'ጸሃይ ስትጠልቅ ወደ ሙዝደሊፋህ ማቅናት ሙዝደሊፋ በ ሚና እና አረፋ የሚገኝ ክፍት ቦታ ነው'),
          FixedCard(
            content:
                'ሙዝደሊፋህ ሲደርሱ የመግሪብ እና የ ኢሻን ሶላት በሙዝደሊፋ መስገድ የ ኢሻን ሶላት ወደ ሁለት ረካዐ በማሳጠር።',
          ),
          FixedCard(
            content: 'ምሽቱን በ ኢባዳ ወይም እረፍት በማድረግ ማሳለፍ ይቻላል።',
          ),
          FixedCard(
            content:
                'በሙዝደሊፋህ ላይ ከተምር ፍረ ያላነሱ በጣምም ያልተለቁ ጠጠሮች መሰብሰብ አጠቃላይ 49 ጠጠሮችን መልቅም ከዛም በላይ ጨምሮ መያዝ ተመራጭ ነው መሳትም ሊኖር ስለሚችል',
          )
        ],
        imgPath: 'assets/images/bg_image/muzdalifa_bg.png',
        color: const Color(0xFF003665),
      ),
    );
  }
}
