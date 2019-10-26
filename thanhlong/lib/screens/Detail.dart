import 'dart:async';
import 'dart:math';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swthanhlongfilm/main.dart';
import 'package:swthanhlongfilm/models/Ads.dart';
import 'package:swthanhlongfilm/screens/PlayerUI.dart';
import 'package:swthanhlongfilm/youtube_player/youtube_player_controller.dart';
import 'package:swthanhlongfilm/youtube_player/youtube_player_flutter.dart';
import 'package:swthanhlongfilm/models/Ads.dart';

final youtubePlayerKey = GlobalKey<DetailState>();

typedef YoutubePlayerControllerCallback(YoutubePlayerController controller);

class Detail extends StatefulWidget {
  Duration controlsTimeOut = const Duration(seconds: 3);
  YoutubePlayerControllerCallback onPlayerInitialized;

  DetailState createState() => DetailState();
}

class DetailState extends State<Detail> {
  YoutubePlayerController ytController;
  String videoId = '';

  YoutubePlayerController get controller => ytController;

  set controller(YoutubePlayerController c) => ytController = c;

  final _showControls = ValueNotifier<bool>(false);

  int currentPosition = 0;
  int totalDuration = 0;
  double loadedFraction = 0;
  Timer _timer;

  String title = '';
  double paddingTop = 60;
  Object header;
  final textInputController = TextEditingController();

  String _currentVideoId;

  @override
  void initState() {
    super.initState();

    updateView();

    Timer.periodic(new Duration(seconds: 2), (timer) {
      setState(() {
       updateView();
      });
    });

    _loadController();
    _currentVideoId = videoId;
    _showControls.addListener(() {
      _timer?.cancel();
      if (_showControls.value)
        _timer =
          Timer(widget.controlsTimeOut, () => _showControls.value = false);
    });
  }

  updateView(){
    if(Ads.isFullScreen){
         paddingTop = 0;
         header = PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar( // Here we create one to set status bar color
            backgroundColor: Colors.black, 
          )
        );
       } else {
         paddingTop = 60;
         header =  AppBar(
            title: Text(title, style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
            iconTheme: new IconThemeData(color: Colors.yellowAccent),
            backgroundColor: Color.fromRGBO(50, 50, 50, 1),
          );
       }
  }

   _loadController({WebViewController webController}) {
    controller = YoutubePlayerController(videoId);
    if (webController != null)
      controller.value =
          controller.value.copyWith(webViewController: webController);
    controller.addListener(listener);
    if (widget.onPlayerInitialized != null)
      widget.onPlayerInitialized(controller);
  }

  void listener() async {
    if (controller.value.isLoaded && mounted) {
      setState(() {
        currentPosition = controller.value.position.inMilliseconds;
        totalDuration = controller.value.duration.inMilliseconds;
        loadedFraction = currentPosition / totalDuration;
        if (loadedFraction > 1) loadedFraction = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_currentVideoId != videoId) {
      _currentVideoId = videoId;
      _loadController(webController: controller.value.webViewController);
      controller.load();
      Future.delayed(Duration(milliseconds: 500),
          () => controller.seekTo(Duration(seconds: 0)));
    }

    final FilmInfo args = ModalRoute.of(context).settings.arguments;
    title = args.title;
    setState(() {
     videoId =  args.videoKey;
    });
    
    return Scaffold(
      appBar: header,
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
                child: PlayerUI.buildPlayer(controller, _showControls),
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
    Ads.hideInterstitialAd();
  }
}
