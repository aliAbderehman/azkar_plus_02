import 'package:share_plus/share_plus.dart';

class ShareApp {
  static shareApp() {
    const String appLink =
        "https://play.google.com/store/apps/details?id=com.ankabootechs.akarplusamharic&pcampaignid=web_share";
    const String message = "Check out this awesome app!\n\n$appLink";

    Share.share(message);
  }
}
