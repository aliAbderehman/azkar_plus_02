import 'package:flutter/material.dart';

import '../../materials/fixed_card.dart';
import '../../materials/reusable_popup.dart';
import '../../materials/reusable_sliding_up_panel.dart';

class Telbiyah extends StatelessWidget {
  const Telbiyah({super.key});

  @override
  Widget build(BuildContext context) {
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.63;
    final panelHeightOpened = MediaQuery.of(context).size.height - 80;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ተልቢያ'),
        actions: const <Widget>[ReusablePopUp()],
      ),
      body: ReusableSlidingUpPanel(
        panelHeightClosed: panelHeightClosed,
        panelHeightOpened: panelHeightOpened,
        contents: const [
          FixedCard(
              title: 'ተልቢያ',
              content:
                  ' ፡- ሃጅ ወይም ኡምራ አድራጊዎች ወደ ኢህራም ከገቡ ጀምሮ ጠዋፍ እስከሚጀምሩ ድረስ የሚያሥተጋቡት ወይም የሚሉት ዚክር ነው።\n\n- ተልቢያን የቻሉትን ያህል አብዝተው ማለት\n- ተልቢያን ቆመው፣ ተቀምጠው ወይም ሲጓዙም ማለት ይቻላል።\n- ተልቢያ በጠዋፍ እና በ ሰዕይ ወቅት ላይ መባል የለበትም'),
          FixedCard(
            preContent: 'ተልቢያ:-\n',
            title:
                'لَبَّيْكَ اللهُمَّ لَبَّيْكَ – لَبَّيْكَ لَا شَرِيْكَ لَكَ لَبَّيْكَ – إِنَّ الْحَمْدَ وَالنِّعْمَةَ لَكَ وَالْمُلْكَ – لَا شَرِيْكَ لَكَ',
            content:
                '\n\nንባብ፦ ለበይክ አላሁመ ለበይክ፣ ለበይከ ላ ሸሪከ ለከ ለበይክ፣ ኢነል ህምደ፣ ወኒዕመተ፤ ለከወልሙልክ፣ ላ ሸሪከ ለክ\n\nትርጉም:- አቤት(ጥሪህን ተቀብያለሁ) አላህ ሆይ አቤት፣ አቤት ለአንተ አጋር የሌለህ አቤት፣ ምስጋና እና ጸጋዎች ሁሉ ላንተ የተገቡ ናቸው፣ እንዲሁም ባለቤትነት ላንተ የተገባ ሲሆን፣ ላንተም አጋር የሌለህ ሲሆን',
          ),
          FixedCard(
              title:
                  '\nተልቢያን ሲያስተጋቡ ወንዶች ድምጻቸውን ከፍ አድርገው ሲሆን ሴቶች ድምጻቸውን ዝቅ ማድረግ ይኖርባቸዋል'),
        ],
        imgPath: 'assets/images/bg_image/telbiyah_bg_02.png',
        color: const Color.fromARGB(255, 93, 155, 191),
      ),
    );
  }
}
