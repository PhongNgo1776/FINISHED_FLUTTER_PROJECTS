import 'package:flutter/widgets.dart';
import 'package:swcttfilm/enums/PlayerStateEnum.dart';
import 'package:swcttfilm/youtube_player/Player.dart';
import 'package:swcttfilm/youtube_player/youtube_player_flutter.dart' as prefix0;

class YoutubePlayerValue {
  YoutubePlayerValue({
    @required this.isReady,
    this.isLoaded = false,
    this.hasPlayed = false,
    this.duration = const Duration(),
    this.position = const Duration(),
    this.buffered = 0.0,
    this.isPlaying = false,
    this.isFullScreen = false,
    this.volume = 100,
    this.playerState = PlayerStateEnum.UNKNOWN,
    this.errorCode = 0,
    this.webViewController,
  });

  /// This is true when underlying web player reports ready.
  final bool isReady;

  /// This is true once video loads.
  final bool isLoaded;

  /// This is true once the video start playing for the first time.
  final bool hasPlayed;

  /// The total length of the video.
  final Duration duration;

  /// The current position of the video.
  final Duration position;

  /// The position up to which the video is buffered.
  final double buffered;

  /// Reports true if video is playing.
  final bool isPlaying;

  /// Reports true if video is fullscreen.
  final bool isFullScreen;

  /// The current volume assigned for the player.
  final int volume;

  /// The current state of the player defined as [PlayerState].
  final PlayerStateEnum playerState;

  /// Reports the error code as described [here](https://developers.google.com/youtube/iframe_api_reference#Events).
  /// See the onError Section.
  final int errorCode;

  /// Reports the [WebViewController].
  final prefix0.WebViewController webViewController;

  /// Returns true is player has errors.
  bool get hasError => errorCode != 0;

  YoutubePlayerValue copyWith({
    bool isReady,
    bool isLoaded,
    bool hasPlayed,
    Duration duration,
    Duration position,
    double buffered,
    bool isPlaying,
    bool isFullScreen,
    double volume,
    PlayerStateEnum playerState,
    int errorCode,
    prefix0.WebViewController webViewController,
  }) {
    return YoutubePlayerValue(
      isReady: isReady ?? this.isReady,
      isLoaded: isLoaded ?? this.isLoaded,
      duration: duration ?? this.duration,
      hasPlayed: hasPlayed ?? this.hasPlayed,
      position: position ?? this.position,
      buffered: buffered ?? this.buffered,
      isPlaying: isPlaying ?? this.isPlaying,
      isFullScreen: isFullScreen ?? this.isFullScreen,
      volume: volume ?? this.volume,
      playerState: playerState ?? this.playerState,
      errorCode: errorCode ?? this.errorCode,
      webViewController: webViewController ?? this.webViewController,
    );
  }

  @override
  String toString() {
    return '$runtimeType('
        'isReady: $isReady, '
        'isLoaded: $isLoaded, '
        'duration: $duration, '
        'position: $position, '
        'buffered: $buffered, '
        'isPlaying: $isPlaying, '
        'volume: $volume, '
        'playerState: $playerState, '
        'errorCode: $errorCode)';
  }
}
