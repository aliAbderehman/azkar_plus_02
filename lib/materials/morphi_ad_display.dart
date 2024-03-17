import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class MorphiAdDisplay extends StatelessWidget {
  const MorphiAdDisplay({
    super.key,
    required this.child,
    required this.height,
    required this.width,
  });

  final Offset distance = const Offset(15, 15);
  final double blur = 15.0;
  final Widget child;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return AnimatedContainer(
      height: height,
      width: width,
      duration: const Duration(milliseconds: 10),
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: themeState.getDarkTheme
              ? const Color(0xFF2E3239)
              : const Color(0xFFE7ECEF),
          boxShadow: [
            BoxShadow(
              offset: distance,
              color: themeState.getDarkTheme
                  ? const Color(0xFF23262a)
                  : const Color(0xFFA7A9AF),
              blurRadius: blur,
              inset: false,
            ),
            BoxShadow(
              offset: -distance,
              color: themeState.getDarkTheme
                  ? const Color(0xFF35393F)
                  : const Color.fromARGB(255, 255, 255, 255),
              blurRadius: blur,
              inset: false,
            ),
          ]),
      child: Expanded(
        child: child,
      ),
    );
  }
}
