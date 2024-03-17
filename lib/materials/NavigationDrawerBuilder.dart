// ignore_for_file: file_names

import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import '../provider/dark_theme_provider.dart';
import 'overlay_builder.dart';

class NavigationDrawerBuilder extends StatelessWidget {
  final ovLay = const AdOverlay();

  const NavigationDrawerBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    return NavigationDrawer(children: [
      SafeArea(
        child: Column(
          children: [
            const Image(
              image: AssetImage('assets/images/MainLogo.png'),
              height: 150,
              width: 150,
            ),
            Text(
              'ሃጅ እና ዑምራ',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Divider(
          height: 50,
          thickness: 2,
        ),
      ),
      SwitchListTile(
          activeColor: Colors.amber,
          title: const Text('Theme'),
          secondary: Icon(themeState.getDarkTheme
              ? Icons.dark_mode_outlined
              : Icons.light_mode_outlined),
          value: themeState.getDarkTheme,
          onChanged: (bool value) {
            themeState.setDarkTheme = value;
          }),
      ListTile(
        onTap: () {
          // WidgetsBinding.instance!
          //     .addPostFrameCallback((_) => ovLay.showOverlay());
        },
        leading: const Icon(Icons.share_outlined),
        title: const Text('Share this app'),
      ),
    ]);
  }
}
