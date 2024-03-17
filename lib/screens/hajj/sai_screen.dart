import 'package:flutter/material.dart';

import '../../materials/fixed_card.dart';
import '../../materials/reusable_popup.dart';
import '../../materials/reusable_sliding_up_panel.dart';

class Sai extends StatelessWidget {
  const Sai({super.key});

  @override
  Widget build(BuildContext context) {
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.63;
    final panelHeightOpened = MediaQuery.of(context).size.height - 80;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ሰዕይ'),
        actions: const <Widget>[ReusablePopUp()],
      ),
      body: ReusableSlidingUpPanel(
        panelHeightClosed: panelHeightClosed,
        panelHeightOpened: panelHeightOpened,
        contents: const [
          FixedCard(
              title: ' ሰፋ እና መርዋ',
              content:
                  '\nሳዕይን ጠዋፍን ካጠናቀቅን በኋላ ሲሆን የምንፈጽመው ሳዒ ማለት በሰፋ እና መርዋ ተራሮች የሚደረግ መመላለስ ነው።'),
          FixedCard(
            content: 'ዑምራን ብቻ የሚፈጽሙ ተጓዦች ሳዒን ከ ጠዋፍ አል-ኡምራ በኋላ መፈጸም ይኖርባቸዋል',
          ),
          FixedCard(
            content:
                'ሃጅ አል ተመቱዕ የሚፈጽሙ ተጓዦች ሳዒን ሁለት ግዜ መፈጸም ይጠበቅባቸዋል የመጀመሪያው ከ ጠዋፍ አል ዑምራ በኋላ ሲሆን ሁለተኛው ከ ጠዋፍ አል ዚያራ አስከትለው።',
          ),
          FixedCard(
            content:
                'ሃጅ አል-ቂራን እና ሃጅ አል-ኢፍራድ ሳዒን አንድ ግዜ በ ጠዋፍ አል ቁዱም ወይም ጠዋፍ አል ዚያራ አንድ ግዜ ካደረጉ ሁለተኛ ማድረግ አይጠበቅባቸውም',
          ),
          FixedCard(
            preContent: 'ሳዕይ ',
            title: '7 ዙሮች',
            content:
                ' ያሉት ሲሆን የመጀመሪያው ዙር ከሰፋ ጀምሮ ወደ መርዋ በመሄድ ይደረጋል። ሁለተኛው ዙር ከመርዋ ወደ ሰፋ በዚህ አይነት ሰባት ግዜ ይደረጋል  የመጨረሻው መርዋ ላይ ያልቃል',
          )
        ],
        imgPath: 'assets/images/bg_image/sai_bg.png',
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}
