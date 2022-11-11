import 'dart:developer';

import 'package:crypto_app/admob/ad_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdProvider with ChangeNotifier {
  bool isHomePagebannerloaded = false;
  late BannerAd homePageBanner;

  bool isdetailPagebannerloaded = false;
  late BannerAd detailPageBanner;

  bool isfullpageloaded = false;
  late InterstitialAd fullPageAd;

  void initHomePageBanner() async {
    homePageBanner = BannerAd(
        size: AdSize.banner,
        adUnitId: AdHelper.homePageBanner(),
        listener: BannerAdListener(onAdLoaded: ((ad) {
          isHomePagebannerloaded = true;
        }), onAdClosed: (ad) {
          ad.dispose();
          isHomePagebannerloaded = false;
        }, onAdFailedToLoad: ((ad, error) {
          log(error.toString());
          isHomePagebannerloaded = false;
        })),
        request: const AdRequest());
    await homePageBanner.load();
    notifyListeners();
  }

  void initdetailPageBanner() async {
    detailPageBanner = BannerAd(
        size: AdSize.banner,
        adUnitId: AdHelper.detailPageBanner(),
        listener: BannerAdListener(onAdLoaded: ((ad) {
          isdetailPagebannerloaded = true;
        }), onAdClosed: (ad) {
          ad.dispose();
          isdetailPagebannerloaded = false;
        }, onAdFailedToLoad: ((ad, error) {
          log(error.toString());
          isdetailPagebannerloaded = false;
        })),
        request: const AdRequest());
    await detailPageBanner.load();
    notifyListeners();
  }

  void initFullPageAd() async {
    await InterstitialAd.load(
        adUnitId: AdHelper.fullPageAd(),
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: ((ad) {
          fullPageAd = ad;
          isfullpageloaded = true;
        }), onAdFailedToLoad: ((error) {
          log(error.toString());
          isfullpageloaded = false;
        })));
    notifyListeners();
  }
}
