import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  const CardButton(
      {super.key,
      required this.icnImage,
      required this.lable,
      required this.navigation});
  final String lable;
  final String icnImage;
  final String navigation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, navigation);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(width: 100, height: 100, image: AssetImage(icnImage)),
              Text(
                lable,
                style: Theme.of(context).textTheme.headlineSmall,
              )
            ],
          )),
    );
  }
}
