import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:provider/provider.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:vibration/vibration.dart';

import '../../provider/dark_theme_provider.dart';

class MorphiOpj extends StatefulWidget {
  final Function counterCount;
  // Function? resetCounter;
  final bool isVibrate;
  final Widget? buttunLable;
  final double? height;
  final double? width;
  const MorphiOpj(
      {super.key,
      required this.isVibrate,
      required this.counterCount,
      this.buttunLable,
      this.height,
      this.width});
  @override
  State<MorphiOpj> createState() => _MorphiOpjState();
}

class _MorphiOpjState extends State<MorphiOpj> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    double blur = isPressed ? 5.0 : 40.0;
    Offset distance = isPressed ? const Offset(10, 10) : const Offset(30, 30);
    final themeState = Provider.of<DarkThemeProvider>(context);

    return Listener(
      onPointerDown: (_) => setState(() => isPressed = true),
      onPointerUp: (event) {
        setState(() {
          if (widget.isVibrate) {
            Vibration.vibrate(duration: 50, amplitude: 200);
          }

          widget.counterCount();
          isPressed = false;
        });
      },
      onPointerCancel: (event) {
        setState(() {
          isPressed = false;
        });
      },
      child: AnimatedContainer(
          height: widget.height ?? 200,
          width: widget.width ?? 200,
          duration: const Duration(milliseconds: 150),
          // margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: themeState.getDarkTheme
                  ? const Color(0xFF2E3239)
                  : const Color(0xFFE7ECEF),
              // borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  offset: distance,
                  color: themeState.getDarkTheme
                      ? const Color.fromARGB(155, 25, 28, 31)
                      : const Color(0xFF86898B),
                  blurRadius: blur,
                  inset: isPressed,
                ),
                BoxShadow(
                  offset: -distance,
                  color: themeState.getDarkTheme
                      ? const Color.fromRGBO(55, 59, 68, 0.608)
                      : const Color(0xFFFFFFFF),
                  blurRadius: blur,
                  inset: isPressed,
                ),
              ]),
          child: widget.buttunLable
          // child: Icon(
          //   Icons.add_rounded,
          //   size: 100,
          // ),
          // height: 800,
          // width: 800,
          // ),
          ),
    );
  }
}
