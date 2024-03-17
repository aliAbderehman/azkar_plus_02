import 'package:azkar_plus/materials/fixed_card.dart';
import 'package:azkar_plus/materials/reusable_popup.dart';
import 'package:azkar_plus/materials/reusable_sliding_up_panel.dart';
import 'package:flutter/material.dart';

class TewafAlUmra extends StatelessWidget {
  const TewafAlUmra({super.key});

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
              title: 'ጠዋፍ ',
              content:
                  'ቃሉ ከ አረበኛው ታፈ ከሚለው የመታ ሲሆን ትርጉሙም አንድን ነገር መዞር ሲሆን ተዋፍ ካዖባን በተቃራኒ ሰአት አቅጣጫ ሰባት ጊዜ መዞርን ያመላክታል'),
          FixedCard(
              // preContent: 'ለጠዋፍ ኒያ ሲያደርጉ የሚባል ዱዓ፡\n',
              title: 'ዝግጅት ',
              content:
                  '\nተዋፍን ለምፈጸም ከ ቆሻሻዎች መጽዳት እና በ ኡዱ መሆን ዪኖርዎታል። ወንዶች ከ እምብርት እስከ ጉልበት ድርስ ያለው የሰውነት ክፍል መሸፈን ሲኖርባቸው ሴቶች ሙሉ ሰውነታቸውን ከ ፊታቸው እና እጃቸው በቀር መሸፈን አለባቸው።'),
          FixedCard(
              title: 'መጣፍ\n',
              content:
                  'መጣፍ ሲደርሲ ኢድቲባዖ ማድረግ (የቅኝ ጥከሻን መግለጥ) ጠዋፍ እስኪጨርሱ ድረስ ማቆየት\nጠዋፍ የሚጀመርበት ቦታ የካዕባው ጠርዝ ሃጀረል አስወድ(ጠቁሩ ድንጋይ) ያለበት ሲሆን በተቃራኒ ሰአት አቅጣጫ ዞርው ሃጀር አል~አስወድ ሲደርሱ አንድ ዙር ይሆናል ስለዚህ ጠዋፍ ለማድረግ በዚህ አይነት ጊዜ መዞር ይኖርቦታል።'),
          FixedCard(
            preContent:
                'በተዋፍ ወቅት የሚባል ዱዐ \nበጠዋፍ ወቅት ማንኛውም አይነት ዱዐ ማድረግ ይቻላል ተዋፍ ዱዓ ተቀባይ የሚሆንበት ወቅት በመሆኑ\nበ የመኒ ጠርዝ እና ሃጀር አል አስወድ መሃል የሚደረግ ተወዳጅ ዱዐ\n',
            title:
                'رَبَّنَا آتِنَا فِىْ الدُّنْيَا حَسَنَةً وَفِىْ الآخِرَةِ حَسَنَةً وَّقِنَا عَذَابَ النَّارِ',
          ),
        ],
        imgPath: 'assets/images/bg_image/tewaf_bg.png',
        color: const Color(0xFFC1DEE3),
      ),
    );
  }
}
