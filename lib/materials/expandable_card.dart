import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ExpandableCard extends StatelessWidget {
  const ExpandableCard({super.key, required this.content});

  // const ExpandableCard();
  final String content;
  @override
  Widget build(BuildContext context) {
    return buildCard(context);
  }

  Widget buildCard(BuildContext con) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ExpandableNotifier(
          child: Expandable(
            theme: ExpandableThemeData(
                inkWellBorderRadius: BorderRadius.circular(30),
                useInkWell: true,
                animationDuration: const Duration(milliseconds: 400),
                tapBodyToCollapse: true,
                fadeCurve: Curves.decelerate),
            collapsed: ExpandableButton(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Image(
                      image: AssetImage('assets/images/buttons/bullet.png'),
                      width: 20,
                      height: 20,
                    ),
                    Expanded(
                      child: Text(
                        content,
                        style: Theme.of(con).textTheme.bodyLarge,
                        softWrap: true,
                        maxLines: 4,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            expanded: ExpandableButton(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Image(
                      image: AssetImage('assets/images/buttons/bullet.png'),
                      width: 20,
                      height: 20,
                    ),
                    Expanded(
                      child: Text(
                        content,
                        style: Theme.of(con).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
