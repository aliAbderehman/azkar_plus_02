import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../provider/dark_theme_provider.dart';
import '../screens/home_screen.dart';
import 'custom_drawer.dart';

class CustomSlideDrawer extends StatelessWidget {
  const CustomSlideDrawer({
    super.key,
    required this.themeState,
  });

  final DarkThemeProvider themeState;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuBackgroundColor: themeState.getDarkTheme
          ? const Color(0xFF2E3239)
          : const Color(0xFFE7ECEF),
      angle: -7,
      mainScreenScale: 0.1,
      // mainScreenOverlayColor: Colors.amber,
      mainScreenTapClose: true,
      menuScreenWidth: 270,
      mainScreen: const Home(),
      menuScreen: const CustomDrawer(),
      androidCloseOnBackTap: true,
      boxShadow: [
        BoxShadow(
          offset: const Offset(-20.0, -20.0),
          blurRadius: 30.0,
          color: themeState.getDarkTheme
              ? const Color.fromARGB(171, 0, 0, 0)
              : const Color(0xFFA7A9AF),
        )
      ],
    );
  }
}
