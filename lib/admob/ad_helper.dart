import 'dart:io';

class AdHelper {
  static String homePageBanner() {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3642506432959253/7214464471';
    } else {
      return '';
    }
  }
  static String detailPageBanner() {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3642506432959253/6967870703';
    } else {
      return '';
    }
  }
  static String fullPageAd() {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3642506432959253/1715544027';
    } else {
      return '';
    }
  }
}
