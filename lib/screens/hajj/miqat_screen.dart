import 'package:flutter/material.dart';

import '../../materials/fixed_card.dart';
import '../../materials/reusable_popup.dart';
import '../../materials/reusable_sliding_up_panel.dart';

class Miqat extends StatelessWidget {
  const Miqat({super.key});

  @override
  Widget build(BuildContext context) {
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.63;
    final panelHeightOpened = MediaQuery.of(context).size.height - 80;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ሚቃት'),
        actions: const <Widget>[ReusablePopUp()],
      ),
      body: ReusableSlidingUpPanel(
        panelHeightClosed: panelHeightClosed,
        panelHeightOpened: panelHeightOpened,
        contents: const [
          FixedCard(
              title: 'ሚቃት',
              content:
                  '  ማለት የ ወሰን ቦታ ሲሆን ሁጃጆች ኢህራም የሚፈጸሙባቸው ቦታዎች ናቸው።  ኢህራም ሳያደርጉ እነዚን ቦታዎች ማለፍ የተከለከለ ነው። '),
          FixedCard(
              content:
                  ' ረሱል ﷺ  ለተለያዩ አገራቶች አምስት የሚቃት ቦታዋችን ሰይመዋል ከየትኛውም አለም የሚመጡ ትጓዦች በመስመራቸው ላይ የሚገኘውን ሚቃት ይጠቀማሉ'),
          FixedCard(
              title: 'ሚቃቶች',
              content:
                  '\n 1.ዙል-ሁለይፋ፡ ከመዲና እና ከ አካባቢዋ ለሚመጡ ሃጅ አድራጊዎች \n\n2.አል-ጁህፋህ፡ ሱዳን፣ ግብጽ፣ አልጄሪያ፣ ሶሪያ፣ ቱርክ፣ አውሮፓ ሰሜን አሜሪካ እና አንዳንድ አፍሪካ ሃገራቶች\n\n3.ቀርን አል-መናዚል፡ UAE፣ ፓኪስታን፣ ኦማን፣ ማሌዢያ፣ አውስትራሊያ፣ ሲንጋፖር ...\n\n4.ዛትኢርቅ፡ ሩሲያ፣ ቻይና፣ ኢራን እና ኢራቅ \n\n5.ያለምለም፡ ለየመን እና ከመካ በስተ ደቡብ ላሉ ሃገራቶች '),
          FixedCard(
              content:
                  'ከ ኢትዮጵያ የሚሄዱ ተጓዦች  የሚጠቀሙት ሚቃት የለምለምን ሲሆን ነገር ገን አየር የሚያርፈው ብዙ ጊዜ ሳዑድ አረቢያ ጂዳ ኪንግ አብዱልመሊክ አየር ማረፉያ ስለሆነ ማለትም የሚቃት ቦታችንን አልፎት ስለሆነ የሚያርፈው ከመነሻቸው ኢህራምን መፈጸም ይመረጣል'),
        ],
        imgPath: 'assets/images/bg_image/miqat_bg.png',
        color: const Color(0xFF003665),
      ),
    );
  }
}
