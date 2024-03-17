import 'package:flutter/material.dart';

class PanelWidget extends StatelessWidget {
  const PanelWidget({super.key, required this.controller, required this.card});

  final ScrollController controller;
  final List<Widget> card;

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller,
      padding: EdgeInsets.zero,
      children: card,
    );
  }
}
