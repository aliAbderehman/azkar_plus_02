// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class MorphisButtonCircle extends StatelessWidget {
  final bool isPressed = false;

  final bool isDarkMode = true;

  final String lable;
  final String icnImage;
  final Function onPressed;

  const MorphisButtonCircle({
    super.key,
    required this.lable,
    required this.icnImage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double blur = isPressed ? 5.0 : 20.0;
    Offset distance = isPressed ? const Offset(5, 5) : const Offset(10, 10);
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 20, 5, 5),
          child: MorphisStatefullWidget(
            themeState: themeState,
            distance: distance,
            blur: blur,
            isPressed: isPressed,
            icnImage: icnImage,
            onPressed: onPressed,
          ),
        ),
        Text(
          lable,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}

class MorphisStatefullWidget extends StatefulWidget {
  MorphisStatefullWidget(
      {super.key,
      required this.themeState,
      required this.distance,
      required this.blur,
      required this.isPressed,
      required this.icnImage,
      required this.onPressed});

  final DarkThemeProvider themeState;
  final Offset distance;
  final double blur;
  bool isPressed;
  final String icnImage;
  final Function onPressed;

  @override
  State<MorphisStatefullWidget> createState() => _MorphisStatefullWidgetState();
}

class _MorphisStatefullWidgetState extends State<MorphisStatefullWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0),
      child: GestureDetector(
        onTapDown: (_) => setState(() => widget.isPressed = true),
        onTapUp: (event) {
          setState(() {
            widget.isPressed = false;
            widget.onPressed();
            // Navigator.pushNamed(context, widget.routeTo);
          });
        },
        onTapCancel: () {
          setState(() {
            widget.isPressed = false;
          });
        },
        // onVerticalDragEnd: (details) {
        //   widget.isPressed = false;
        // },
        // onHorizontalDragEnd: (details) {
        //   widget.isPressed = false;
        // },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 50),
          // margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.themeState.getDarkTheme
                  ? const Color(0xFF2E3239)
                  : const Color(0xFFE7ECEF),
              // borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  offset: widget.distance,
                  color: widget.themeState.getDarkTheme
                      ? const Color.fromARGB(255, 32, 35, 39)
                      : const Color.fromARGB(255, 187, 189, 196),
                  blurRadius: widget.blur,
                  inset: widget.isPressed,
                ),
                BoxShadow(
                  offset: -widget.distance,
                  color: widget.themeState.getDarkTheme
                      ? const Color(0xFF35393F)
                      : const Color.fromARGB(255, 255, 255, 255),
                  blurRadius: widget.blur,
                  inset: widget.isPressed,
                ),
              ]),
          child: Image(
            image: AssetImage(widget.icnImage),
            height: 90,
            width: 90,
          ),
        ),
      ),
    );
  }
}
