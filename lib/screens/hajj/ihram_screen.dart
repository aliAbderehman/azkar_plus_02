import 'package:flutter/material.dart';
import 'package:azkar_plus/materials/fixed_card.dart';

import '../../materials/reusable_popup.dart';
import '../../materials/reusable_sliding_up_panel.dart';

class Ihram extends StatefulWidget {
  const Ihram({super.key});

  @override
  State<Ihram> createState() => _IhramState();
}

class _IhramState extends State<Ihram> {
  @override
  Widget build(BuildContext context) {
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.63;
    final panelHeightOpened = MediaQuery.of(context).size.height - 80;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ኢህራም'),
        actions: const <Widget>[ReusablePopUp()],
      ),
      body: ReusableSlidingUpPanel(
        panelHeightClosed: panelHeightClosed,
        panelHeightOpened: panelHeightOpened,
        contents: const [
          FixedCard(
            content:
                'ሃጅ እና ኦምራን ለመፈጸም ሲዘጋጁ የመጀመሪያው ክፍል ኢህራም ነው። ያለ ኢህራም ሃጅ እና ኦምራዎ ተቀባይነት አይኖረውም። ',
          ),
          FixedCard(
              content:
                  ' ኢህራም ሃጅን የሚፈጽሙ ትጓዦች ሃጅን ለመፈጸም የመካን ድንበሮች አልፈው ከመግባታቸው በፊት በመሆን የሚጠበቅባቸው ሁነታ ነው። ቃሉ ሃራም ከሚለው ቃል የመጣ ሲሆን ትርጓሜውም መከልከል ማልት ነው።'),
          FixedCard(
              content:
                  ' ሁሉም ተጓዥ ከሚቃት ላይ ኢህራም ማድረግ ይኖርበታል ። ኢህራም እራስን በ ኢህራም ምክኒያት ከሚከለከሉ ነገራቶች በመከልከል እና የ ኢህራም ሊብሲን በመልበስ ይፈጸማል።'),
          FixedCard(
              content:
                  'በኢህራም ወቅት የሚከለከሉ ነገራቶች፡- \n1, ጸጉርን መቁረጥ\n2, ጥፍርን መቁረጥ\n3, ሽቶ መቀባት\n4, ከ ትዳር አጋር ጋር ስሜታዊ ንክኪ\n5, አደን (ማደን)\n6, የተሰፋ ልብስ መልበስ\n7, ጸጉርን (አናትን) መሸፈን \n8, ፊትን መሸፈን ለሴት'),
          FixedCard(
              content:
                  'በ ኢህራም ሁኔታ ዊስጥ ሆነን ጸጉር እና ጥፍርን መቁረጥ የተከለከለ ስለሆነ ከኢህራም በፊት ማድረግ ይመረጣል'),
          FixedCard(
              content:
                  'ወደ ኢህራም ከመግባታችን በፊት ብንፈጽማቸው ሱና ወይም ተመራጭ የሆኑ ተግባራት:- \n1, ትጥበት መፈጸም\n2, ጸጉርና ጺምን ማዘጋጀት\n3, የእጅ እና እግር ጥፍር ማሳጠር\n4, የከንፈር አካባቢ የላኛውን ጺም ማሳጠር\n5, አላስፈላጊ የሰውነት ጸጉርን  ማስወገድ\n6, ሸቶ መቀባት'),
          FixedCard(
              content:
                  'የ ኢህራም ልብሶችን መልበስ በመቀጠል የ ኢህራም ልብስዎን ወንዶች ሁለት ያልተሰፉ ነጫጭ ጨርቆችን (ኢዛር እና ሪዳ) መልበስ ሴቶች በአግባቡ የሚሰትሩ እና የ ሂጃብ መስፈርቲን የሚያሟሉ ልብሶችንን መልበስ ይኖርባቸዋል።'),
        ],
        imgPath: 'assets/images/bg_image/ihram_bg_02.png',
        color: const Color.fromARGB(255, 55, 157, 173),
      ),
    );
  }
}
