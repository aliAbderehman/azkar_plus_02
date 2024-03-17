import 'package:flutter/material.dart';

import '../../materials/fixed_card.dart';
import '../../materials/reusable_popup.dart';
import '../../materials/reusable_sliding_up_panel.dart';

class Halq extends StatelessWidget {
  const Halq({super.key});

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
            title: 'ሃልቅ እና ተቅሲር\n',
            content:
                'የ ሃጅ ተግባራትን ካጠናቀቁ በኋላ ወንዶች ጸጉራቸውን ማሳጠር ወይም መላጨት ሴቶች ከ ጫፉላይ በትንሽ መጠን መቁረጥ',
          ),
          FixedCard(
            content:
                'በዚህ ጊዜ ከ ኢህራም ሁነታ መውጣት ይፈቀዳል። \nአመቺ የሆኑ ልብሶችን መልበስ እንዲሁም ሃላል የነበሩ   በኢህራም ወቅት ብቻ የተከለከሉ ተግባራትን መፈጸምም ይፈቅዳል ከ ትዳር አጋር ጋ ጾታዊ ግንኙነት ሲቅር። ',
          ),
          FixedCard(
            content:
                'አመቺ የሆኑ ልብሶችን መልበስ እንዲሁም ሃላል የነበሩ   በኢህራም ወቅት ብቻ የተከለከሉ ተግባራትን መፈጸምም ይፈቅዳል ከ ትዳር አጋር ጋ ጾታዊ ግንኙነት ሲቅር። ',
          )
        ],
        imgPath: 'assets/images/bg_image/halq_bg_02.png',
        color: const Color(0xFFC1DEE3),
      ),
    );
  }
}
