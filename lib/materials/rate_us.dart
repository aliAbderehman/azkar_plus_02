import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Rate {
  static Future<dynamic> showRateDialog(BuildContext context, themeState) {
    return showDialog(
      builder: (context) {
        return AlertDialog(
          backgroundColor: themeState.getDarkTheme
              ? const Color(0xFF2E3239)
              : const Color(0xFFE7ECEF),
          title: const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star_border_rounded),
                  Icon(Icons.star_border_rounded),
                  Icon(Icons.star_border_rounded),
                  Icon(Icons.star_border_rounded),
                  Icon(Icons.star_border_rounded)
                ],
              ),
              Text('Please Rate Us'),
            ],
          ),
          content: const Text(
            'If you like this app, please take a litle bit of your time to review it! It really helps us and it shouldn\'t take you more than a minute.',
            style: TextStyle(fontSize: 18),
          ),
          // contentTextStyle: TextStyle(fontSize: 15),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('NO THANKS')),
            TextButton(
                onPressed: () async {
                  final Uri url = Uri.parse(
                      'https://play.google.com/store/apps/details?id=com.ankabootechs.akarplusamharic&pcampaignid=web_share');

                  if (await canLaunchUrl(url)) {
                    await launchUrl(
                      url,
                      mode: LaunchMode.externalApplication,
                      webViewConfiguration: const WebViewConfiguration(),
                    );
                  }
                },
                child: const Text('RATE')),
          ],
        );
      },
      context: context,
    );
  }
}
