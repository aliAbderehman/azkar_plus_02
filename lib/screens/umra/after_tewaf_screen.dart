import 'package:azkar_plus/materials/fixed_card.dart';
import 'package:azkar_plus/materials/reusable_popup.dart';
import 'package:azkar_plus/materials/reusable_sliding_up_panel.dart';
import 'package:flutter/material.dart';

class AfterTewaf extends StatelessWidget {
  const AfterTewaf({super.key});

  @override
  Widget build(BuildContext context) {
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.63;
    final panelHeightOpened = MediaQuery.of(context).size.height - 80;
    return Scaffold(
      appBar: AppBar(
        title: const Text('ጠዋፍ አል ዑምራ'),
        actions: const <Widget>[ReusablePopUp()],
      ),
      body: ReusableSlidingUpPanel(
        panelHeightClosed: panelHeightClosed,
        panelHeightOpened: panelHeightOpened,
        contents: const [
          FixedCard(
              title: 'ሰላህ አል ጠዋፍ',
              content: 'ጠዋፍ ከጨረሱ በኋላ ሁለት ረከዐ ሶላት መስገድ ከተቻለ መቃም ኢብራሂም አካባቢ'),
          FixedCard(
              // preContent: 'ለጠዋፍ ኒያ ሲያደርጉ የሚባል ዱዓ፡\n',
              title: 'ዘምዝም',
              content:
                  'ሰላተል ጠዋፍ ከፈጸሙ በኋላ ዘምዘም ውሃ መቅመስ ይወደዳል በሞሆኑም እዛ ቦታ ላይ ዱዐዎች ተቀባይነት ስላላቸው ዱዐ ማድረግ ይወደዳል'),
          FixedCard(
            preContent: ' የሚከተለውን ዱዐ ማድረግ ተውዳጅ ነው',
            title:
                'اللَّهُمَّ إِنِّيأَسْأَلُكَ عِلْمًا نَافِعًا وَرِزْقًا وَاسِعًا وَشِفَاءً مِنْ كُلِّ دَاءٍ',
          )
        ],
        imgPath: 'assets/images/bg_image/tewaf_bg.png',
        color: const Color(0xFFC1DEE3),
      ),
    );
  }
}
