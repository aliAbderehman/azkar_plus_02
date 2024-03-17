// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../settings_screen.dart';

class TesbihPopUp extends StatelessWidget {
  const TesbihPopUp({super.key, this.stateSetter, this.rebuild, this.dispo});
  final Function? stateSetter;
  final Function? rebuild;
  final Function? dispo;
  @override
  Widget build(BuildContext context) {
    void handleClick(String value) {
      switch (value) {
        case 'Home':
          dispo!();
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/', (Route route) => false);
          // Navigator.pushNamed(context, '/');
          break;
        case 'Settings':
          dispo!();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Settings()),
          ).then((value) => rebuild!());
          break;
        case 'Reset Total Count':
          stateSetter!();
          break;
        case 'Exit':
          SystemNavigator.pop();
          break;
      }
    }

    return PopupMenuButton<String>(
      onSelected: handleClick,
      itemBuilder: (BuildContext context) {
        return {'Home', 'Settings', 'Reset Total Count', 'Exit'}
            .map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(
              choice,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        }).toList();
      },
    );
  }
}
