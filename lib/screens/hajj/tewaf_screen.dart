import 'package:flutter/material.dart';

import '../../materials/fixed_card.dart';
import '../../materials/reusable_popup.dart';
import '../../materials/reusable_sliding_up_panel.dart';

class Tewaf extends StatelessWidget {
  const Tewaf({super.key});

  @override
  Widget build(BuildContext context) {
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.63;
    final panelHeightOpened = MediaQuery.of(context).size.height - 80;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ጠዋፍ'),
        actions: const <Widget>[ReusablePopUp()],
      ),
      body: ReusableSlidingUpPanel(
        panelHeightClosed: panelHeightClosed,
        panelHeightOpened: panelHeightOpened,
        contents: const [
          FixedCard(
              title: 'ጠዋፍ ',
              content:
                  'ማለት በካዕባን በእርምጃ ሰባት ጊዜ የመዞር ተግባር ሲሆን እያንዳንዱ ዙር ከ ጥቁሩ ድንጋይ ጀምሮ መልሶ እዛው መድረስ ይጠበቃል በዚህ አይነት ሰባት ግዜ መዞር ሲሆን ሃጅ አል-ተመቱዕ የሚፈጽሙ ተጓዦች አስቀድመው ኡምራን በሚፈጽሙበት ወቅት ኢህራምን ከፈጸሙ በኋላ መካ ሲደርሱ ጠዋፍ ማድረግ ይጠበቅባቸዋል።'),
          FixedCard(
              preContent: 'ለጠዋፍ ኒያ ሲያደርጉ የሚባል ዱዓ፡\n',
              title:
                  'اللَّهُمَّ إِنِّيْ أُرِيْدُ طَوَافَ بَيْتِكَ الْحَرَامِ فَيَسِّرْهُ لِيْ وَتَقَبَّلْهُ مِنِّي',
              content:
                  '\n\nንባብ፡ አላሁመ ኢኒ ኡሪዱ ጠዋፈ በይቲክ አል ሃራም ፈየሲርሁ ሊ ወተቀበልሁ ሚኒ\n\nትርጉም፡ አላህ ሆይ የተቀደሰውን ቤትህን(አል-ሃራም) ተዋፍ ለማድረግ ተዘጋጀሁና አግራልኝ ተቀበለኝም\n\nበመቀጠል የመጀመሪያውን ዙር ሲጨርሱ ከተቻለ ጥቁሩን ድንጋይ መሳም መሳለም-ሰባተኛውን ዙር ሲጨርሱ ከ መቃም ኢብራሂም በስተጀርባ 2 ረካዓ መስገድ'),
          FixedCard(
              title: 'ሚቃቶች',
              content:
                  '\n 1.ዙል-ሁለይፋ፡ ከመዲና እና ከ አካባቢዋ ለሚመጡ ሃጅ አድራጊዎች \n\n2.አል-ጁህፋህ፡ ሱዳን፣ ግብጽ፣ አልጄሪያ፣ ሶሪያ፣ ቱርክ፣ አውሮፓ ሰሜን አሜሪካ እና አንዳንድ አፍሪካ ሃገራቶች\n\n3.ቀርን አል-መናዚል፡ UAE፣ ፓኪስታን፣ ኦማን፣ ማሌዢያ፣ አውስትራሊያ፣ ሲንጋፖር ...\n\n4.ዛትኢርቅ፡ ሩሲያ፣ ቻይና፣ ኢራን እና ኢራቅ \n\n5.ያለምለም፡ ለየመን እና ከመካ በስተ ደቡብ ላሉ ሃገራቶች '),
          FixedCard(
              content:
                  'ከ ኢትዮጵያ የሚሄዱ ተጓዦች  የሚጠቀሙት ሚቃት የለምለምን ሲሆን ነገር ገን አየር የሚያርፈው ብዙ ጊዜ ሳዑድ አረቢያ ጂዳ ኪንግ አብዱልመሊክ አየር ማረፉያ ስለሆነ ማለትም የሚቃት ቦታችንን አልፎት ስለሆነ የሚያርፈው ከመነሻቸው ኢህራምን መፈጸም ይመረጣል'),
        ],
        imgPath: 'assets/images/bg_image/tewaf_bg.png',
        color: const Color(0xFFC1DEE3),
      ),
    );
  }
}
