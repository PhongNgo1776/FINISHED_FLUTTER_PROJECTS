import 'package:firebase_admob/firebase_admob.dart';

const String APP_ID = "ca-app-pub-6420987903580707~2678420457";

const String BANNER_ID = "ca-app-pub-6420987903580707/2804760577";
const String INTERSTITIAL_ID = "ca-app-pub-6420987903580707/6548564462";
const String REWARDED_VIDEO_ID = "ca-app-pub-6420987903580707/4856208849";
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

  static void showBannerAd() {
    if (_bannerAd == null) _bannerAd = _createBannerAd();
    _bannerAd
      ..load()
      ..show(anchorOffset: 0.0, anchorType: AnchorType.bottom);
  }

  static void hideBannerAd() async {
    await _bannerAd.dispose();
    _bannerAd = null;
  }

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

  static void showRewaredVideoAd(){
    RewardedVideoAd.instance.load(adUnitId: REWARDED_VIDEO_ID, targetingInfo: targetingInfo);
      RewardedVideoAd.instance.listener = (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
        if (event == RewardedVideoAdEvent.loaded) {
          RewardedVideoAd.instance.show();
        }
      };
  }
}
