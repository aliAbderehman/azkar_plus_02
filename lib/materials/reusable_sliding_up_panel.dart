import 'package:flutter/material.dart';
import 'package:azkar_plus/materials/panel_widget.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../provider/dark_theme_provider.dart';

class ReusableSlidingUpPanel extends StatelessWidget {
  const ReusableSlidingUpPanel(
      {super.key,
      required this.panelHeightClosed,
      required this.panelHeightOpened,
      required this.contents,
      required this.imgPath,
      required this.color});

  final double panelHeightClosed;
  final double panelHeightOpened;
  final String imgPath;
  final Color color;
  final List<Widget> contents;

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    return SlidingUpPanel(
      backdropOpacity: 1.0,
      backdropColor: themeState.getDarkTheme
          ? const Color.fromARGB(255, 35, 35, 35)
          : const Color.fromARGB(255, 255, 255, 255),
      color: themeState.getDarkTheme
          ? const Color(0xFF2E3239)
          : const Color(0xFFE7ECEF),
      parallaxEnabled: true,
      backdropEnabled: true,
      parallaxOffset: .4,
      minHeight: panelHeightClosed,
      maxHeight: panelHeightOpened,
      borderRadius: BorderRadius.circular(20),
      body: Align(
          alignment: Alignment.topCenter,
          child: Container(
              color: color, child: Image(image: AssetImage(imgPath)))),
      panelBuilder: (sc) => PanelWidget(
        controller: sc,
        card: contents,
      ),
    );
  }
}
