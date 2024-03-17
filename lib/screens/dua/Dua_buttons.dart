// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../materials/morphis_button_rect.dart';
import '../../provider/dark_theme_provider.dart';

class DuaQuranButton extends StatelessWidget {
  const DuaQuranButton({
    super.key,
    required this.themeState,
    required this.textSize,
    required this.text,
    required this.imageSize,
  });

  final DarkThemeProvider themeState;
  final double textSize;
  final String text;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return MorphisButtonRect(
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Positioned(
                // top: 190,
                bottom: 0,
                left: 0,
                child: Image(
                  color: themeState.getDarkTheme
                      ? const Color.fromARGB(139, 33, 36, 41)
                      : const Color.fromARGB(137, 157, 168, 189),
                  image: const AssetImage('assets/images/geo_white.png'),
                  height: 100,
                  width: 100,
                )),
            Positioned(
                // alignment: Alignment.topRight,
                // top: 130,
                bottom: 100,
                left: 0,
                child: Image(
                  color: themeState.getDarkTheme
                      ? const Color.fromARGB(139, 33, 36, 41)
                      : const Color.fromARGB(137, 157, 168, 189),
                  image: const AssetImage('assets/images/geo_white.png'),
                  // height: 80,
                  // width: 80,
                )),
            Positioned(
                // alignment: Alignment.topRight,
                bottom: 20,
                // left: 140,
                right: -1,
                child: Image(
                  image: const AssetImage('assets/images/quran_05.png'),
                  // : const AssetImage(
                  //     'assets/images/hadith_light_03.png'),
                  height: imageSize,
                  width: imageSize,
                )),
            Positioned(
              bottom: 0,
              right: 0,
              child: FittedBox(
                child: Lable(
                  lable: text,
                  size: textSize,
                ),
              ),
            )
          ],
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, 'quran_dua');
      },
    );
  }
}

class Lable extends StatelessWidget {
  const Lable({super.key, required this.lable, required this.size});
  final String lable;
  final double size;

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(lable,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.bold,
            color: themeState.getDarkTheme
                ? const Color.fromARGB(255, 130, 121, 105)
                : const Color.fromARGB(255, 130, 130, 130),
          )),
    );
  }
}

class DuaHadithButton extends StatelessWidget {
  const DuaHadithButton({
    super.key,
    required this.themeState,
    required this.size,
    required this.text,
    required this.imageSize,
  });

  final DarkThemeProvider themeState;
  final double size;
  final String text;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return MorphisButtonRect(
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Positioned(
                // top: 190,
                top: 0,
                right: 0,
                child: Image(
                  color: themeState.getDarkTheme
                      ? const Color.fromARGB(139, 33, 36, 41)
                      : const Color.fromARGB(137, 157, 168, 189),
                  image: const AssetImage('assets/images/geo_white.png'),
                  height: 100,
                  width: 100,
                )),
            Positioned(
                top: 100,
                right: 0,
                child: Image(
                  color: themeState.getDarkTheme
                      ? const Color.fromARGB(139, 33, 36, 41)
                      : const Color.fromARGB(137, 157, 168, 189),
                  image: const AssetImage('assets/images/geo_white.png'),
                  height: 80,
                  width: 80,
                )),
            Positioned(
                top: 20,
                left: -1,
                child: Image(
                  image: const AssetImage('assets/images/hadith_05.png'),
                  height: imageSize,
                  width: imageSize,
                )),
            Positioned(
              top: 0,
              left: 0,
              child: FittedBox(
                child: Lable(
                  lable: text,
                  size: size,
                ),
              ),
            )
          ],
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, 'hadith_dua');
      },
    );
  }
}

// class DuaButtonShort extends StatelessWidget {
//   const DuaButtonShort(
//       {super.key,
//       required this.themeState,
//       required this.size,
//       required this.text,
//       required this.imageSize});

//   final DarkThemeProvider themeState;
//   final double size;
//   final String text;
//   final double imageSize;
//   @override
//   Widget build(BuildContext context) {
//     return MorphisButtonRect(
//       icon: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Stack(
//           children: [
//             Image(
//               color: themeState.getDarkTheme
//                   ? const Color.fromARGB(139, 33, 36, 41)
//                   : const Color.fromARGB(137, 157, 168, 189),
//               image: const AssetImage('assets/images/geo_white.png'),
//               height: 100,
//               width: 100,
//             ),
//             Image(
//               color: themeState.getDarkTheme
//                   ? const Color.fromARGB(139, 33, 36, 41)
//                   : const Color.fromARGB(137, 157, 168, 189),
//               image: const AssetImage('assets/images/geo_white.png'),
//               height: 80,
//               width: 80,
//             ),
//             Image(
//               image: const AssetImage('assets/images/hadith_05.png'),
//               height: imageSize,
//               width: imageSize,
//             ),
//             FittedBox(
//               child: Lable(
//                 lable: text,
//                 size: size,
//               ),
//             )
//           ],
//         ),
//       ),
//       onPressed: () {
//         Navigator.pushNamed(context, 'hadith_dua');
//       },
//     );
//   }
// }
