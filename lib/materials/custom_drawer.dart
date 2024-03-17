import 'package:azkar_plus/app_link.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      const Image(
                        image: AssetImage('assets/logo/right_07.png'),
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Azkar Plus Am',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(
                    height: 50,
                    thickness: 2,
                  ),
                ),
                ListTile(
                    leading: const Icon(Icons.settings_outlined),
                    // activeColor: const Color.fromARGB(255, 203, 138, 17),
                    title: const Text('Settings'),
                    // secondary: const Icon(Icons.format_size_rounded),
                    // value: textState.getTextSize,
                    onTap: () {
                      Navigator.pushNamed(context, 'settings_screen');
                      // textState.setTextSize = value;
                    }),
                const Divider(),
                ListTile(
                    leading: const Icon(Icons.bookmark_outline),
                    // activeColor: const Color.fromARGB(255, 203, 138, 17),
                    title: const Text('Bookmarks'),
                    // secondary: const Icon(Icons.format_size_rounded),
                    // value: textState.getTextSize,
                    onTap: () {
                      Navigator.pushNamed(context, 'faq_screen');
                      // textState.setTextSize = value;
                    }),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.star_rate_outlined),
                  title: const Text('Rate Us'),
                  onTap: () async {
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
                ),
                const Divider(),
                ListTile(
                  onTap: () {
                    ShareApp.shareApp();
                    // WidgetsBinding.instance!
                    //     .addPostFrameCallback((_) => ovLay.showOverlay());
                  },
                  leading: const Icon(Icons.share_outlined),
                  title: const Text('Share this app'),
                ),
                const Divider(),
                ListTile(
                  onTap: () async {
                    final Uri url = Uri.parse('https://www.ankabootechs.com');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(
                        url,
                        mode: LaunchMode.externalApplication,
                        webViewConfiguration: const WebViewConfiguration(),
                      );
                    }
                  },
                  leading: const Icon(FontAwesomeIcons.addressCard),
                  title: const Text('Developer Contact'),
                ),
                const Divider(),
                ListTile(
                  onTap: () async {
                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'developer@ankabootechs.com',
                    );
                    if (await canLaunchUrl(emailLaunchUri)) {
                      await launchUrl(
                        emailLaunchUri,
                      );
                    } else {
                      throw Exception('Could not launch $emailLaunchUri');
                    }
                  },
                  leading: const Icon(Icons.report_problem_outlined),
                  title: const Text('Report Issue'),
                ),
              ],
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text('Ankaboot Technologies'),
            ),
          )
        ],
      ),
    );
  }
}
