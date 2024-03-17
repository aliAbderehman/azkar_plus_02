import 'package:azkar_plus/materials/reusable_popup.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('About'),
          actions: const <Widget>[ReusablePopUp()],
        ),
        bottomNavigationBar: const SizedBox(),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: SingleChildScrollView(
                  child: Text(
                    'بِسْمِ ٱللَّهِ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ'
                    '\n The Azkar Plus app is a comprehensive Islamic application'
                    ' designed to enrich and enhance your spiritual practices. With'
                    ' features such as a collection of Azkar '
                    '(remembrances and supplications), Qibla direction indicator, '
                    'Tasbih counter for counting prayers, a variety of Duas (prayers)'
                    ', and a detailed guide for Hajj and Umrah, this app serves as a'
                    ' complete resource for Muslims seeking to deepen their '
                    'connection with their faith. Whether you\'re looking to engage '
                    'in consistent remembrance, find the direction of the Qibla,'
                    ' keep track of your Tasbih count, or access important '
                    'supplications and guidance for pilgrimage, the Azkar Plus app '
                    'is your all-in-one companion for a more enriching and '
                    'fulfilling spiritual journey',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Text('Ankaboot Technologies'),
            ],
          ),
        ));
  }
}
