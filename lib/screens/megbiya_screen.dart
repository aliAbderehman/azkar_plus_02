// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:azkar_plus/content_texts/megbiya_text.dart';
import 'package:azkar_plus/materials/fixed_card.dart';
import 'package:azkar_plus/provider/text_size_provider.dart';
import 'package:provider/provider.dart';

import '../materials/reusable_popup.dart';
import '../provider/dark_theme_provider.dart';

class Megbiya extends StatefulWidget {
  const Megbiya({super.key});

  @override
  State<Megbiya> createState() => _MegbiyaState();
}

class _MegbiyaState extends State<Megbiya> {
  List<String> duasFromQuran = [
    'رَبَّنَا آمَنَّا بِمَا أَنزَلْتَ وَاتَّبَعْنَا الرَّسُولَ فَاكْتُبْنَا مَعَ الشَّاهِدِينَ'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            actions: const <Widget>[ReusablePopUp()],
            floating: true,
            snap: true,
            title: Text('መግቢያ'),
          )
        ],
        body: ListView(
          children: [
            Center(
              child: Text(
                'بسم الله الرحمن الرحيم',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Text(
              'رَبَّنَا آمَنَّا بِمَا أَنزَلْتَ وَاتَّبَعْنَا الرَّسُولَ فَاكْتُبْنَا مَعَ الشَّاهِدِينَ',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            FixedCard(
              content: duasFromQuran[0],
            ),
            FixedCard(
              content: MegbiyaContent().content,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Text(
                'የ ሃጅ አይነቶች በሶስት የከፈላሉ ለነሱም የተለያዩ አይነት አፈጻጸም አላቸው',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            EditedText(
              firstText: 'ሃጅ አል-ኢፍራድ ',
              secondText:
                  '፡ ይህ የ ሃጅ አይነት ሃጅን ብቻ ሲሆን እርድ መፈጸም አይጠበቅቦትም። የዚህን አይነት ሃጅ የሚፈጽም ተጓዥ ሙፍሪድ ይባላል።',
            ),
            EditedText(
                firstText: 'ሃጅ አል-ቂራን',
                secondText:
                    ' : ይህኛው አፈጻጸም ሃጅን እና ዑምራንበ አንድ ኢህራም እና ኒያ  የሚፈጽሙበት ሁኔታ ሲሆን እርድ ማቅረብ ግዴታ ይሆናል። የዚህን አይነት ሃጅ የሚፈጽም ተጓዥ ቀሪን ይባላል።'),
            EditedText(
                firstText: 'ሃጅ አል-ተመቱዕ',
                secondText:
                    ' : ይህኛው የሃጅ አይነት ተመራጭ የሆነ ወይም ረሱል ﷺ ሶሃቦቻቸውን እንዲሰሩ ያበረታቱ የነበረው የሃጅ አይነት ሲሆን አፈጻጸሙም የ ሃጅ ወራቶች(ሸዋል፣  ዙልቃዕዳ እና ዙል-ሂጃ) ከገቡ ጀምሮ ሃጅ ከመድረሱ በፊት ዑምራን አስቀድሞ በመፈጸምድጋሚ የ ሃጅ ውቅት ሲደርስ በሌላ ኢህራም ሃጅንመፈጸም። የዚህን አይነት ሃጅ የሚፈጽም ተጓዥ ሙተመቲዕ ይባላል።'),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: () {}, child: Text('ክፍሎች')),
            )
          ],
        ),
      ),
    );
  }
}

class EditedText extends StatelessWidget {
  const EditedText(
      {super.key, required this.firstText, required this.secondText});
  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final textState = Provider.of<TextSizeProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: firstText,
            style: richStyle(themeState, textState),
          ),
          TextSpan(
              text: secondText, style: Theme.of(context).textTheme.bodyLarge)
        ]),
      ),
    );
  }

  TextStyle richStyle(
      DarkThemeProvider themeState, TextSizeProvider textState) {
    return TextStyle(
        color: themeState.getDarkTheme
            ? Color.fromARGB(255, 69, 67, 64)
            : Color.fromARGB(255, 130, 130, 130),
        fontSize: textState.getTextSize ? 40 : 20,
        fontFamily: 'Segoe',
        fontWeight: FontWeight.bold);
  }
}





// Container(
//             decoration: BoxDecoration(
//               boxShadow: const [
//                 BoxShadow(
//                     color: Color.fromARGB(255, 170, 167, 167),
//                     blurRadius: 10.0,
//                     spreadRadius: 0.2,
//                     offset: Offset(2, 5))
//               ],
//               color: Color.fromARGB(255, 184, 231, 255),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             margin: EdgeInsets.all(10),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 8, top: 8),
//                   child: Image(
//                     image: AssetImage('assets/images/buttons/bullet.png'),
//                     width: 20,
//                     height: 20,
//                   ),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Expandable(
//                       collapsed: Text('ከ አምስቱ የ እስልምና መሰረቶች ውስጥ'),
//                       expanded: Text(
//                         '     ከ አምስቱ የ እስልምና መሰረቶች ውስጥ 5ኛው እና የመጨረሻው ሃጅ ይካተትበታል። ሃጅ ወደ መካ የሚደረግ የአምልኮ ጉዞ ሲሆን በ አረቦቹ በ ዙል ሂጃ ወር በ ስምንተኛው የሚጀምር ሲሆን በ 12ኛው ያበቃል ታዲያ ይህ ጉዞ ለሁሉም ሙስሊም በገንዘብም ሆነ በጉልበት አቅሙ እስከቻለ ድረስ በህይወት ዘመኑ ቢያንስ አንድ ግዜ ሃጅ እንዲያደርግ ግዴታ ተደርጓል። በለላኛው ዑምራ እንደ ሃጅ ወደ መካ የሚደረግ ጉዞ ቢሆንም ነገርግን ግዳጅ አልተደረገም። ዑምራ በማንኛውም ወቅት ልንፈጽመው የምንችላው ተወዳጅ ተግባር ነው።',
//                         style: Theme.of(context).textTheme.bodyLarge,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),