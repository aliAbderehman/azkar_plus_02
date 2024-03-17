import 'package:flutter/material.dart';

import '../../materials/fixed_card.dart';
import '../../materials/reusable_popup.dart';
import '../../materials/reusable_sliding_up_panel.dart';

class Rami extends StatelessWidget {
  const Rami({super.key});

  @override
  Widget build(BuildContext context) {
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.63;
    final panelHeightOpened = MediaQuery.of(context).size.height - 80;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ረምይ'),
        actions: const <Widget>[ReusablePopUp()],
      ),
      body: ReusableSlidingUpPanel(
        panelHeightClosed: panelHeightClosed,
        panelHeightOpened: panelHeightOpened,
        contents: const [
          FixedCard(
            content:
                'የዙልሂጃ 10፣ 11 እና 12ኛ ቀናቶች ላይ ረምይ መፈጸም ይኖርብዎታል። ረምይ ( ረምይ ወደ ሸይጣን ላይ የ ጠጠሮች ውርወራ )',
          ),
          FixedCard(
            content:
                '- በ 10ኛ ዙልሂጃ 7 ጠጠሮችን \n- በ 11ኛ ዙልሂጃ 21 ጠጠሮችን \n- በ 12ኛ ዙልሂጃ 21 ጠጠሮችን የሚወረወሩ ይሆናል',
          ),
          FixedCard(
            content:
                'ወደ ጀመራት ሲደርሱ ወደ ጀመራት አል-ዐቀባ መጓዝ እናም የመጀመሪያውን የ ሰባት ጠጠሮች ውርወራ እዚህ ያከናውናሉ። እያንዳንዱን ውርወራ ሲያከናውኑ ተክቢር(አላሁአክበር)  ይላሉ።',
          )
        ],
        imgPath: 'assets/images/bg_image/rami_bg.png',
        color: const Color(0xFFFFF8E2),
      ),
    );
  }
}
