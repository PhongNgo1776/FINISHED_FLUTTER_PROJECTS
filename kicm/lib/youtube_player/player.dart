import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swkicm/enums/PlayerStateEnum.dart';
import 'package:swkicm/youtube_player/youtube_player_controller.dart';
import 'package:swkicm/youtube_player/youtube_player_flags.dart';
import 'package:swkicm/youtube_player/youtube_player_flutter.dart';

/// Current state of the player. Find more about it [here](https://developers.google.com/youtube/iframe_api_reference#Playback_status)

class Player extends StatefulWidget {
  final YoutubePlayerController controller;
  final YoutubePlayerFlags flags;

  Player({
    this.controller,
    this.flags,
  });

  @override
  PlayerState createState() => PlayerState();
}

class PlayerState extends State<Player> {
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: WebView(
        initialUrl:
            'https://sarbagyadhaubanjar.github.io/youtube_player/youtube.html',
        javascriptMode: JavascriptMode.unrestricted,
        // iOSWebViewConfiguration: IOSWebViewConfiguration(
        //   allowsInlineMediaPlayback: true,
        //   allowsPictureInPictureMediaPlayback: true,
        //   mediaTypesRequiringUserActionForPlayback: {},
        //   allowsAirPlayForMediaPlayback: true,
        // ),
        javascriptChannels: <JavascriptChannel>[
          JavascriptChannel(
            name: 'Ready',
            onMessageReceived: (JavascriptMessage message) {
              widget.controller.value =
                  widget.controller.value.copyWith(isReady: true);
            },
          ),
          JavascriptChannel(
            name: 'StateChange',
            onMessageReceived: (JavascriptMessage message) {
              switch (message.message) {
                case '-1':
                  widget.controller.value = widget.controller.value.copyWith(
                      playerState: PlayerStateEnum.UN_STARTED, isLoaded: true);
                  break;
                case '0':
                  widget.controller.value = widget.controller.value
                      .copyWith(playerState: PlayerStateEnum.ENDED);
                  break;
                case '1':
                  widget.controller.value = widget.controller.value.copyWith(
                    playerState: PlayerStateEnum.PLAYING,
                    isPlaying: true,
                    hasPlayed: true,
                    isLoaded: true,
                    errorCode: 0,
                  );
                  break;
                case '2':
                  widget.controller.value = widget.controller.value.copyWith(
                    playerState: PlayerStateEnum.PAUSED,
                    isPlaying: false,
                  );
                  break;
                case '3':
                  widget.controller.value = widget.controller.value
                      .copyWith(playerState: PlayerStateEnum.BUFFERING);
                  break;
                case '5':
                  widget.controller.value = widget.controller.value
                      .copyWith(playerState: PlayerStateEnum.CUED);
                  break;
                default:
                  throw Exception("Invalid player state obtained.");
              }
            },
          ),
          JavascriptChannel(
            name: 'PlaybackQualityChange',
            onMessageReceived: (JavascriptMessage message) {
              print("PlaybackQualityChange ${message.message}");
            },
          ),
          JavascriptChannel(
            name: 'PlaybackRateChange',
            onMessageReceived: (JavascriptMessage message) {
              print("PlaybackRateChange ${message.message}");
            },
          ),
          JavascriptChannel(
            name: 'Errors',
            onMessageReceived: (JavascriptMessage message) {
              widget.controller.value = widget.controller.value
                  .copyWith(errorCode: int.tryParse(message.message) ?? 0);
            },
          ),
          JavascriptChannel(
            name: 'VideoData',
            onMessageReceived: (JavascriptMessage message) {
              var videoData = jsonDecode(message.message);
              double duration = videoData['duration'] * 1000;
              print("VideoData ${message.message}");
              widget.controller.value = widget.controller.value.copyWith(
                duration: Duration(
                  milliseconds: duration.floor(),
                ),
              );
            },
          ),
          JavascriptChannel(
            name: 'CurrentTime',
            onMessageReceived: (JavascriptMessage message) {
              double position = (double.tryParse(message.message) ?? 0) * 1000;
              widget.controller.value = widget.controller.value.copyWith(
                position: Duration(
                  milliseconds: position.floor(),
                ),
              );
            },
          ),
          JavascriptChannel(
            name: 'LoadedFraction',
            onMessageReceived: (JavascriptMessage message) {
              widget.controller.value = widget.controller.value.copyWith(
                buffered: double.tryParse(message.message) ?? 0,
              );
            },
          ),
        ].toSet(),
        onWebViewCreated: (webController) {
          widget.controller.value = widget.controller.value
              .copyWith(webViewController: webController);
        },
        onPageFinished: (_) {
          if (widget.flags.forceHideAnnotation)
            widget.controller.forceHideAnnotation();
          if (widget.flags.mute) widget.controller.mute();
          if (widget.controller.value.isReady)
            widget.flags.autoPlay
                ? widget.controller.load()
                : widget.controller.cue();
        },
      ),
    );
  }
}