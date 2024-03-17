import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3757793309031108/2578558385'; //real id
      // return 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3757793309031108/4373434909'; //real id
      // return 'ca-app-pub-3940256099942544/1033173712';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/4411468910';
    } else {
      throw UnsupportedError('Unsupported Platform');
    }
  }

  static String get nativeAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3757793309031108/2542090863'; // real
      // return 'ca-app-pub-3940256099942544/2247696110';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/3986624511';
    }
    throw UnsupportedError("Unsupported platform");
  }

  // static String get rewardedInterstialAdUnitId {
  //   if (Platform.isAndroid) {
  //     return 'ca-app-pub-3940256099942544/5354046379';
  //   } else if (Platform.isIOS) {
  //     return 'ca-app-pub-3940256099942544/6978759866';
  //   } else {
  //     throw UnsupportedError('Unsupported Platform');
  //   }
  // }

  static String get appOpenAdUnitId {
    if (Platform.isAndroid) {
      // return 'ca-app-pub-3757793309031108/8569251669'; ral
      return 'ca-app-pub-3940256099942544/3419835294';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/5662855259';
    } else {
      throw UnsupportedError('Unsupported Platform');
    }
  }

  // static String get rewardedAdUnitId {
  //   if (Platform.isAndroid) {
  //     return 'ca-app-pub-3940256099942544/5224354917';
  //   } else if (Platform.isIOS) {
  //     return 'ca-app-pub-3940256099942544/1712485313';
  //   } else {
  //     throw UnsupportedError('Unsupported Platform');
  //   }
  // }
}
