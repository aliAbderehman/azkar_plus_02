import 'package:google_mobile_ads/google_mobile_ads.dart';

class Consent {
  static final params = ConsentRequestParameters();

  static void requestConsent() {
    ConsentInformation.instance.requestConsentInfoUpdate(
      params,
      () async {
        if (await ConsentInformation.instance.isConsentFormAvailable()) {
          loadForm();
        }
      },
      (FormError error) {
        // Handle the error
      },
    );
    ConsentDebugSettings debugSettings = ConsentDebugSettings(
        debugGeography: DebugGeography.debugGeographyEea,
        testIdentifiers: ['51a88232-852e-4cab-bf36-ab898bf4a27f']);

    ConsentRequestParameters testparams =
        ConsentRequestParameters(consentDebugSettings: debugSettings);

    ConsentInformation.instance
        .requestConsentInfoUpdate(testparams, () {}, (error) {});
  }

  static void loadForm() {
    ConsentForm.loadConsentForm(
      (ConsentForm consentForm) async {
        var status = await ConsentInformation.instance.getConsentStatus();
        if (status == ConsentStatus.required) {
          consentForm.show((formError) {
            loadForm();
          });
        }
      },
      (FormError formError) {
        // print(formError);
      },
    );
  }

  static void resetConsent() {
    ConsentInformation.instance.reset();
  }
}
