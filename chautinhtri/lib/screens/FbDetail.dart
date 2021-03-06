import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swcttfilm/main.dart';
import 'package:swcttfilm/models/Ads.dart';
import 'package:swcttfilm/screens/chewie_list_item.dart';
import 'package:swcttfilm/youtube_player/youtube_player_controller.dart';
import 'package:toast/toast.dart';
import 'package:video_player/video_player.dart';

final youtubePlayerKey = GlobalKey<FbDetailState>();

typedef YoutubePlayerControllerCallback(YoutubePlayerController controller);

class FbDetail extends StatefulWidget {
  Duration controlsTimeOut = const Duration(seconds: 3);
  YoutubePlayerControllerCallback onPlayerInitialized;

  FbDetailState createState() => FbDetailState();
}

class FbDetailState extends State<FbDetail> {
  YoutubePlayerController ytController;
  String videoId = '';

  YoutubePlayerController get controller => ytController;

  set controller(YoutubePlayerController c) => ytController = c;
  int currentPosition = 0;
  int totalDuration = 0;
  double loadedFraction = 0;

  String title = '';
  double paddingTop = 60;
  Object header;
  final dio = new Dio();

  String _currentVideoId;

  VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    final FilmInfo args = ModalRoute.of(context).settings.arguments;
    title = args.title;
    setState(() {
      _videoPlayerController = VideoPlayerController.network(args.videoKey);
    });

    return  Scaffold(
      appBar: AppBar(
        title: Text(args.title, style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
        iconTheme: new IconThemeData(color: Colors.yellowAccent),
        backgroundColor: Color.fromRGBO(50, 50, 50, 1),
      ),
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(image: new AssetImage('images/bg.png'), fit: BoxFit.cover,),
            ),
          ),
          new Container(
            padding: EdgeInsets.only(top: paddingTop),
            child: Column(
            children: <Widget>[
              Container(
                color: Colors.black,
                child: ChewieListItem(
                              videoPlayerController: _videoPlayerController,
                              looping: false,
                            )
              ),
              
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                padding: EdgeInsets.only(left: 10, right: 10,top: 10),
                child: Container(
                  child: Text(args.title, style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
                )
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.yellow,
                    onPressed: () {
                      setState(() {
                        videoId = '';
                      });

                      Timer(Duration(seconds: 1), (){
                        setState(() {
                          videoId = args.videoKey;
                        });
                      });
                    },
                    child: Text('Play', style: TextStyle(color: Colors.blue),),
                  ),
                  RaisedButton(
                      color: Colors.yellow,
                      onPressed: () {
                        var rng = new Random();
                        if(rng.nextInt(10) > 5){
                          InterstitialAd(
                            adUnitId: INTERSTITIAL_ID,
                            targetingInfo: Ads.targetingInfo,
                          )..load()..show();
                        }
                        
                        _videoPlayerController.pause();
                        _videoPlayerController.seekTo(Duration(hours: 9));
                        Timer(Duration(seconds: 2), () => _videoPlayerController.dispose());
                        Navigator.pop(context, true);
                      },
                      child: Text('Danh sách video', style: TextStyle(color: Colors.red),),
                    ),
                ],
              )
          ],)
        ),
      ])
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  
}
