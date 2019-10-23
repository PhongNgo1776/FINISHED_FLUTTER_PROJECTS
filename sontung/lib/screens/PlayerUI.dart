import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swmtp/enums/PlayerStateEnum.dart';
import 'package:swmtp/youtube_player/controls.dart';
import 'package:swmtp/youtube_player/player.dart';
import 'package:swmtp/youtube_player/progress_bar.dart';
import 'package:swmtp/youtube_player/youtube_player_controller.dart';
import 'package:swmtp/youtube_player/youtube_player_flags.dart';
import 'package:swmtp/youtube_player/youtube_utils.dart';

typedef YoutubePlayerControllerCallback(YoutubePlayerController controller);

class PlayerUI{
  double width;
  static double aspectRatio = 16/9;
  static Duration controlsTimeOut = const Duration(seconds: 3);
  static Widget bufferIndicator;
  static ProgressColors progressColors;
  static Color videoProgressIndicatorColor = Colors.yellow;
  static YoutubePlayerControllerCallback onPlayerInitialized;
  static Color liveUIColor = Colors.yellow;
  static List<Widget> actions;
  static String thumbnailUrl;
  static YoutubePlayerFlags flags = const YoutubePlayerFlags();

  static buildPlayer(YoutubePlayerController controller, ValueNotifier<bool> _showControls){
    return AspectRatio(
      aspectRatio:PlayerUI.aspectRatio,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: <Widget>[
          Player(
            controller: controller,
            flags: PlayerUI.flags,
          ),
          if (!controller.value.hasPlayed &&
              controller.value.playerState == PlayerStateEnum.BUFFERING)
            Container(
              color: Colors.black,
            ),
          if (!controller.value.hasPlayed && !PlayerUI.flags.hideThumbnail)
            if(controller.initialSource.length > 0)
              Image.network(
                PlayerUI.thumbnailUrl ??
                    YoutubeUtils.getThumbnail(
                      videoId: controller.initialSource,
                    ),
                fit: BoxFit.cover,
              ),
          if (!PlayerUI.flags.hideControls)
            TouchShutter(
              controller,
              _showControls,
              PlayerUI.flags.disableDragSeek,
            ),
          if (!PlayerUI.flags.hideControls)
            (controller.value.position > Duration(milliseconds: 100) &&
                    !_showControls.value &&
                    PlayerUI.flags.showVideoProgressIndicator &&
                    !PlayerUI.flags.isLive &&
                    !controller.value.isFullScreen)
                ? Positioned(
                    bottom: -27.9,
                    left: 0,
                    right: 0,
                    child: IgnorePointer(
                      ignoring: true,
                      child: ProgressBar(
                        controller,
                        colors: ProgressColors(
                          handleColor: Colors.transparent,
                          playedColor: PlayerUI.videoProgressIndicatorColor,
                        ),
                      ),
                    ),
                  )
                : Container(),
          if (!PlayerUI.flags.hideControls)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: PlayerUI.flags.isLive
                  ? LiveBottomBar(
                      controller,
                      _showControls,
                      PlayerUI.aspectRatio,
                      PlayerUI.liveUIColor,
                      PlayerUI.flags.hideFullScreenButton,
                    )
                  : BottomBar(
                      controller,
                      _showControls,
                      PlayerUI.aspectRatio,
                      PlayerUI.progressColors,
                      PlayerUI.flags.hideFullScreenButton,
                    ),
            ),
          if (!PlayerUI.flags.hideControls && _showControls.value)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                opacity:
                    (!PlayerUI.flags.hideControls && _showControls.value) ? 1 : 0,
                duration: Duration(milliseconds: 300),
                child: Row(
                  children: PlayerUI.actions ?? [Container()],
                ),
              ),
            ),
          if (!PlayerUI.flags.hideControls)
            Center(
              child: PlayPauseButton(
                controller,
                _showControls,
                PlayerUI.bufferIndicator ??
                    Container(
                      width: 70.0,
                      height: 70.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    ),
              ),
            ),
        ],
      ),
    );
  }
}