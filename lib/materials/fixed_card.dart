import 'package:flutter/material.dart';
import 'package:azkar_plus/provider/text_size_provider.dart';
import 'package:provider/provider.dart';

class FixedCard extends StatelessWidget {
  const FixedCard({super.key, this.content, this.title, this.preContent});
  final String? content;
  final String? preContent;

  final String? title;

  @override
  Widget build(BuildContext context) {
    final textSize = Provider.of<TextSizeProvider>(context);

    return Card(
      margin: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage('assets/images/buttons/bullet.png'),
              width: 20,
              height: 20,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SelectableText.rich(
                TextSpan(children: [
                  TextSpan(
                      text: preContent,
                      style: Theme.of(context).textTheme.bodyLarge),
                  TextSpan(
                    text: title,
                    style: TextStyle(
                        color: const Color(0xffFFA765),
                        fontSize: textSize.getTextSize ? 40 : 20,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                      text: content,
                      style: Theme.of(context).textTheme.bodyLarge)
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
