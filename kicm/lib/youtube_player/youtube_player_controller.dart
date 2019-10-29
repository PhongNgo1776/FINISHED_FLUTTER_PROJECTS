import 'dart:math';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:swkicm/models/Ads.dart';
import 'package:swkicm/youtube_player/YoutubePlayerValue.dart';

class YoutubePlayerController extends ValueNotifier<YoutubePlayerValue> {
  final String initialSource;

  YoutubePlayerController([
    this.initialSource = "",
  ]) : super(YoutubePlayerValue(isReady: false));

  _evaluateJS(String javascriptString) {
    value.webViewController?.evaluateJavascript(javascriptString);
  }

  /// Hide YouTube Player annotations like title, share button and youtube logo.
  void forceHideAnnotation() => _evaluateJS('hideAnnotations()');

  /// Plays the video.
  void play() => _evaluateJS('play()');

  /// Pauses the video.
  void pause() => _evaluateJS('pause()');

  /// Loads the video as per the [videoId] provided.
  void load({int startAt = 0}) =>
      _evaluateJS('loadById("$initialSource", $startAt)');

  /// Cues the video as per the [videoId] provided.
  void cue({int startAt = 0}) =>
      _evaluateJS('cueById("$initialSource", $startAt)');

  /// Mutes the player.
  void mute() => _evaluateJS('mute()');

  /// Un mutes the player.
  void unMute() => _evaluateJS('unMute()');

  /// Sets the volume of player.
  /// Max = 100 , Min = 0
  void setVolume(int volume) => volume >= 0 && volume <= 100
      ? _evaluateJS('setVolume($volume)')
      : throw Exception("Volume should be between 0 and 100");

  /// Seek to any position. Video auto plays after seeking.
  /// The optional allowSeekAhead parameter determines whether the player will make a new request to the server
  /// if the seconds parameter specifies a time outside of the currently buffered video data.
  /// Default allowSeekAhead = true
  void seekTo(Duration position, {bool allowSeekAhead = true}) {
    _evaluateJS('seekTo(${position.inSeconds},$allowSeekAhead)');
    play();
    value = value.copyWith(position: position);
  }

  /// Forces to enter fullScreen.
  void enterFullScreen([bool autoRotationEnabled = false]) {
    Ads.hideBannerAd();

    pause();
    value = value.copyWith(isFullScreen: true);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      if (autoRotationEnabled) ...[
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]
    ]);

    SystemChrome.setEnabledSystemUIOverlays([]);
    play();
  }

  /// Forces to exit fullScreen.
  void exitFullScreen() {

    var rng = new Random();
    if(rng.nextInt(10) > 3){
      InterstitialAd(
        adUnitId: INTERSTITIAL_ID,
        targetingInfo: Ads.targetingInfo,
      )..load()..show();
    }
    
    Ads.showBannerAd();
    
    pause();
    value = value.copyWith(isFullScreen: false);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    play();
  }
}