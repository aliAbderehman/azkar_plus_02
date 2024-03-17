import 'package:flutter/material.dart';

import '../../materials/fixed_card.dart';
import '../../materials/reusable_popup.dart';
import '../../materials/reusable_sliding_up_panel.dart';

class Arefa extends StatelessWidget {
  const Arefa({super.key});

  @override
  Widget build(BuildContext context) {
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.63;
    final panelHeightOpened = MediaQuery.of(context).size.height - 80;

    return Scaffold(
      appBar: AppBar(
        title: const Text('አረፋ'),
        actions: const <Widget>[ReusablePopUp()],
      ),
      body: ReusableSlidingUpPanel(
        panelHeightClosed: panelHeightClosed,
        panelHeightOpened: panelHeightOpened,
        contents: const [
          FixedCard(
            content:
                'የ አረፋህ ቅን ለሙስሊሞች ታላቅ ቀን ነው አላህ(ሱታ) በ ሱራህ አል ማዒዳ እንደገለጸው እስልምና የተሟላበት ቀን፣ የ ረሱል (ሰዐወ) መልዕክት የተሟላበት ቀን፣ አላህ እስልምናን በኛ ላይ እንደወደደ የገለጸበት ቅን የህ የተከበረ ቀን ነው ',
          ),
          FixedCard(
            content:
                'ረሱል ﷺ እንደተናገሩት:-\n “አላህ ሰዎችን ከ እሳት ነጻ የሚያወጣበት ቀን ከ አረፋህ የበለጠ የለም። እርሱ(አላህ) ወደ እነዛ (አረፋ ላይ የቆሙት) ሰዎች ይቀርባል እናም ወደ መላዕኮቹ በመገለጥ ‘ምንድን ነው እኒህ ሰዎች የሚጠይቁት’ ይላል”ስለዚህ በዚህ ቀን የ አረፋ ተራራ ላይ ቆሞ ዱዐ ኢስቲግፋር ማድረግ ትልቅ ጠቅሜታ አለው። እዛውም ጸሃይ እስክትጠልቅ መቆየት',
          ),
        ],
        imgPath: 'assets/images/bg_image/arefa_bg.png',
        color: const Color(0xFFF3E4B2),
      ),
    );
  }
}
