import 'dart:async';
import 'dart:math';

import 'package:swjfla/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swjfla/models/Ads.dart';
import 'package:swjfla/youtube_player/progress_bar.dart';
import 'package:swjfla/youtube_player/youtube_player.dart';

// import 'package:swjfla/youtube_player/youtube_player_flutter.dart';
// import 'package:youtube_player/youtube_player.dart';
// import 'package:swjfla/youtube_player/youtube_player.dart';
// import 'package:swjfla/youtube_player/youtube_player_flutter.dart';
// import 'package:swjfla/models/ChewieItem.dart';


class Detail extends StatefulWidget {
  final String title;
  final String message;

  const Detail({
    Key key,
    this.title,
    this.message,
  }) : super(key: key);

  DetailState createState() => DetailState();
}

class DetailState extends State<Detail> {
  var isFirstTime = true;

  // Future<bool> _onWillPop() {
  //   // return SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // }

  @override
  void initState() {
    super.initState();
    // Ads.hideBannerAd();
    // Ads.hideBanner1Ad();
    // Ads.showBanner2Ad();

    var rng = new Random();
    if(rng.nextInt(10) < 3) Ads.showRewaredVideoAd();
  }

  @override
  Widget build(BuildContext context) {
    final FilmInfo args = ModalRoute.of(context).settings.arguments;
    return  Scaffold(
      // appBar: AppBar(
      //   title: Text('Chi tiết'),
      //   backgroundColor: Color.fromRGBO(50, 50, 50, 1),
      // ),
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(image: new AssetImage('images/bg.png'), fit: BoxFit.cover,),
            ),
          ),
          new Container(
            child: Column(
            children: <Widget>[
              YoutubePlayer(
                  context: context,
                  videoId: args.videoKey,
                  liveUIColor: Colors.amber,
                  progressColors: ProgressColors(
                    playedColor: Colors.amber,
                    handleColor: Colors.amberAccent,
                  )
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                margin: EdgeInsets.only(top: 15),
                child: Column(
                  children: <Widget>[
                    Text("If can't play video, please back to list of video and choose video again. Thanks.", style: TextStyle(color: Colors.red),),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                margin: EdgeInsets.only(top: 15),
                child: RaisedButton(
                  color: Colors.yellow,
                  onPressed: () {
                    // Ads.showBanner1Ad();
                    Navigator.pop(context, true);
                  },
                  child: Text('List Of Videos', style: TextStyle(color: Colors.red),),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text(args.content, style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
              )
          ],)
        ),
      ])
    );
  }

  @override
  void dispose() {
    super.dispose();
    Ads.hideInterstitialAd();
  }
}
