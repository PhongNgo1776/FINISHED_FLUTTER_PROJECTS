import 'package:firebase_admob/firebase_admob.dart';

const String APP_ID = "ca-app-pub-6420987903580707~3357693913";


const String BANNER_ID = "ca-app-pub-6420987903580707/1703607568";
const String INTERSTITIAL_ID = "ca-app-pub-6420987903580707/1221172086";
const String REWARDED_ID = "ca-app-pub-6420987903580707/6446891681";
const String testDevice = 'YOUR_DEVICE_ID';

class Ads {
  static BannerAd _bannerAd;
  static InterstitialAd _interstitialAd;

  static void initialize() {
    FirebaseAdMob.instance.initialize(appId: APP_ID);
  }

  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
  );

  static BannerAd _createBannerAd() {
    return BannerAd(
      adUnitId: BANNER_ID,
      size: AdSize.banner,
      targetingInfo: targetingInfo,
    );
  }

  static InterstitialAd _createInterstitial() {
    return InterstitialAd(
      adUnitId: INTERSTITIAL_ID,
      targetingInfo: targetingInfo,
    );
  }

  // SHOW/HIDE BANNER
  static void showBannerAd() {
    if (_bannerAd == null) _bannerAd = _createBannerAd();
    _bannerAd
      ..load()
      ..show(anchorOffset: 85.0, anchorType: AnchorType.top, );
  }

  static void hideBannerAd() async {
    await _bannerAd.dispose();
    _bannerAd = null;
  }

  // SHOW/HIDE INTERSTITIAL
  static void showInterstitialAd() {
    if (_interstitialAd == null) _interstitialAd = _createInterstitial();
    _interstitialAd
      ..load()
      ..show();
  }

  static void hideInterstitialAd() async {
    await _interstitialAd.dispose();
    _interstitialAd = null;
  }

  // SHOW/HIDE REWARED VIDEO
  static void showRewaredVideoAd(){
    RewardedVideoAd.instance.load(adUnitId: REWARDED_ID, targetingInfo: targetingInfo);
      RewardedVideoAd.instance.listener = (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
        if (event == RewardedVideoAdEvent.loaded) {
          RewardedVideoAd.instance.show();
        }
      };
  }
}
