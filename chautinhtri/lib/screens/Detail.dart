import 'dart:async';

import 'package:flutter/services.dart';
import 'package:swcttfilm/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swcttfilm/models/Ads.dart';
import 'package:swcttfilm/youtube_player/progress_bar.dart';
import 'package:swcttfilm/youtube_player/youtube_player.dart';
// import 'package:swcttfilm/youtube_player/youtube_player_flutter.dart';
// import 'package:youtube_player/youtube_player.dart';
// import 'package:swcttfilm/youtube_player/youtube_player.dart';
// import 'package:swcttfilm/youtube_player/youtube_player_flutter.dart';
// import 'package:swcttfilm/models/ChewieItem.dart';


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

  Future<bool> _onWillPop() {
    Ads.showBannerAd();
    return SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void initState() {
    super.initState();
    Ads.hideBannerAd();
    Ads.hideBanner1Ad();
    Ads.showBanner2Ad();

    Timer.periodic(new Duration(seconds: 2400), (timer) {
      Ads.showRewaredVideoAd();
    });

    // Ads.showBanner2Ad();
  }

  @override
  Widget build(BuildContext context) {
    final FilmInfo args = ModalRoute.of(context).settings.arguments;
    return  Scaffold(
      // appBar: AppBar(
      //   title: Text('Chi tiết'),
      //   backgroundColor: Color.fromRGBO(50, 50, 50, 1),
      // ),
      body: new WillPopScope(
      onWillPop: _onWillPop,
      child: new Stack(
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
                child: RaisedButton(
                  color: Colors.yellow,
                  onPressed: () {
                    Ads.showBanner1Ad();
                    Navigator.pop(context, true);
                  },
                  child: Text('Danh sách phim', style: TextStyle(color: Colors.red),),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text(args.content, style: TextStyle(color: Colors.yellow),),
              )
          ],)
        ),
      ])
    ));
  }

  @override
  void dispose() {
    super.dispose();
    Ads.hideBanner3Ad();
    Ads.hideInterstitialAd();
  }
}
