import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class MorphisButtonRect extends StatelessWidget {
  final bool isPressed = false;

  final bool isDarkMode = true;

  final Widget? lable;
  // final String? icnImage;
  final Function onPressed;
  final Widget? icon;
  final AlignmentGeometry? alignment;

  const MorphisButtonRect(
      {super.key,
      this.lable,
      // this.icnImage,
      required this.onPressed,
      this.icon,
      this.alignment});

  @override
  Widget build(BuildContext context) {
    double blur = isPressed ? 5.0 : 15.0;
    Offset distance = isPressed ? const Offset(10, 10) : const Offset(15, 15);
    final themeState = Provider.of<DarkThemeProvider>(context);
    return MorphisStatefullWidget(
      lable: lable,
      themeState: themeState,
      distance: distance,
      blur: blur,
      alignment: alignment,
      // isPressed: isPressed,
      // icnImage: icnImage,
      // routeTo: navigation!,
      doSomething: onPressed,
      icon: icon ?? const SizedBox(),
    );
  }
}

class MorphisStatefullWidget extends StatefulWidget {
  const MorphisStatefullWidget({
    super.key,
    required this.themeState,
    required this.distance,
    required this.blur,
    // required this.isPressed,
    // this.icnImage,
    required this.doSomething,
    required this.lable,
    required this.icon,
    this.alignment,
  });

  final DarkThemeProvider themeState;
  final Offset distance;
  final double blur;
  // final String? icnImage;
  final Function doSomething;
  final Widget? lable;
  final Widget? icon;
  // final Widget? lable
  final AlignmentGeometry? alignment;

  @override
  State<MorphisStatefullWidget> createState() => _MorphisStatefullWidgetState();
}

class _MorphisStatefullWidgetState extends State<MorphisStatefullWidget> {
  bool isPressed = false;
  bool isLabled = false;
  bool haveWidget = false;

  @override
  Widget build(BuildContext context) {
    if (widget.lable != null) {
      isLabled = true;
    }
    // if (widget.Decoration != null) {
    //   decore = true;
    // }
    return GestureDetector(
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (event) {
        setState(() {
          widget.doSomething();

          isPressed = false;
          // Navigator.pushNamed(context, widget.routeTo);
        });
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      onHorizontalDragCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: AnimatedContainer(
        height: 120,
        width: double.infinity,
        duration: const Duration(milliseconds: 10),
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            // image: decore ? Decoration: ,
            // image: const DecorationImage(
            // image: AssetImage('assets/images/halq_05.png'),
            // alignment: Alignment.centerLeft,
            // fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(30),
            color: widget.themeState.getDarkTheme
                ? const Color(0xFF2E3239)
                : const Color(0xFFE7ECEF),
            // borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                offset: widget.distance,
                color: widget.themeState.getDarkTheme
                    ? const Color(0xFF23262a)
                    : const Color(0xFFA7A9AF),
                blurRadius: widget.blur,
                inset: isPressed,
              ),
              BoxShadow(
                offset: -widget.distance,
                color: widget.themeState.getDarkTheme
                    ? const Color(0xFF35393F)
                    : const Color.fromARGB(255, 255, 255, 255),
                blurRadius: widget.blur,
                inset: isPressed,
              ),
            ]),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Align(
                alignment: widget.alignment ?? Alignment.centerLeft,
                child: widget.icon,
              ),
            ),
            Container(
              child: isLabled ? widget.lable : null,
            ),
          ],
        ),
      ),
    );
  }
}
