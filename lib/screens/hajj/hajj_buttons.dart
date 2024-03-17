import 'package:flutter/material.dart';

import '../../materials/hajj_umra_button.dart';

class HajjButtons extends StatelessWidget {
  const HajjButtons({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> hajjButtons = [
      const HajjUmraButton(
        imgPath: 'assets/images/ihram_05.png',
        lable: 'ኢህራም',
        navigateTo: 'ihram_screen',
      ),
      const HajjUmraButton(
        imgPath: 'assets/images/miqat_05.png',
        lable: 'ሚቃት',
        navigateTo: 'miqat_screen',
      ),
      const HajjUmraButton(
        imgPath: 'assets/images/telbiyah_05.png',
        lable: 'ተልቢያ',
        navigateTo: 'telbiyah_screen',
      ),
      const HajjUmraButton(
        imgPath: 'assets/images/tewaf_05.png',
        lable: 'ጠዋፍ',
        navigateTo: 'tewaf_screen',
      ),
      const HajjUmraButton(
        imgPath: 'assets/images/sai_05.png',
        lable: 'ሳዕይ',
        navigateTo: 'sai_screen',
      ),
      const HajjUmraButton(
        imgPath: 'assets/images/mina_05.png',
        lable: 'ሚና',
        navigateTo: 'mina_screen',
      ),
      const HajjUmraButton(
        imgPath: 'assets/images/arafa_05.png',
        lable: 'አረፋ',
        navigateTo: 'arefa_screen',
      ),
      const HajjUmraButton(
        imgPath: 'assets/images/muzdalifa_05.png',
        lable: 'ሙዝደሊፋ',
        navigateTo: 'muzdalifa_screen',
      ),
      const HajjUmraButton(
        imgPath: 'assets/images/rami_05.png',
        lable: 'ረምይ',
        navigateTo: 'rami_screen',
      ),
      const HajjUmraButton(
        imgPath: 'assets/images/hadi_05.png',
        lable: 'ሃድይ',
        navigateTo: 'hadi_screen',
      ),
      const HajjUmraButton(
        imgPath: 'assets/images/halq_05.png',
        lable: 'ሃልቅ/ተቅሲር',
        navigateTo: 'halq_screen',
      ),
    ];

    return Column(
      children: hajjButtons,
    );
  }
}

class Lable extends StatelessWidget {
  const Lable({super.key, required this.lable});
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(lable, style: Theme.of(context).textTheme.headlineSmall),
    );
  }
}
