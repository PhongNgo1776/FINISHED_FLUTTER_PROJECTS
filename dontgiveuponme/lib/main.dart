import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:dontgiveuponme/chewie_list_item.dart';
import 'package:dontgiveuponme/ads.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController tabController;
  Widget _tabBarView;
  VideoPlayerController _videoPlayerController;
  var scrollController = ScrollController();
  var isFirstTime = true;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network('https://phongngo1776.github.io/Videos/FiveFeetApart/FiveFeetApart_AndyGrammer_DontGiveUpOnMe.mp4')
    ..addListener(() {
        final bool isPlaying = _videoPlayerController.value.isPlaying;
        if(isPlaying){
          if(isFirstTime){
            Ads.hideInterstitialAd();
          } else {
            Ads.showInterstitialAd();
          }

          isFirstTime = false;
          // new Timer(const Duration(milliseconds: 5000), () {
          //   setState(() {
          //     myInterstitial.dispose();
          //   });
          // });
        } else {
          Ads.hideInterstitialAd();
          if(!isFirstTime){
            Ads.showRewaredVideoAd();
          }
        }
        // Toast.show(isPlaying.toString(), context);
      });
    
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    _tabBarView = TabBarView(children: [
      DemoTab(parentController: scrollController)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Five Feet Apart - Don\'t Give Up On Me', style: TextStyle(color: Colors.yellowAccent),),
        backgroundColor: Color.fromRGBO(50, 50, 50, 1),
      ),
      body: NestedScrollView(
          controller: scrollController,
          physics: ScrollPhysics(parent: PageScrollPhysics()),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                    [Container(
                      height: 300, 
                      color: Colors.black,
                      child: Container(
                              margin: EdgeInsets.only(top: 60),
                              color: Colors.black,
                              child: ChewieListItem(
                              videoPlayerController: _videoPlayerController,
                              looping: true,
                            ),
                      )
                    )]),
              ),
            ];
          },
          body: DefaultTabController(
            length: 1,
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(width: 32.0, height: 0.0),
                      Row(
                        children: <Widget>[
                          Icon(Icons.format_align_justify, size: 20.0, color: Colors.grey),
                          Text("Lyric", 
                            style: TextStyle(fontSize: 20, color: Colors.red, 
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue,
                              decorationStyle: TextDecorationStyle.solid,
                              shadows: [
                                Shadow(
                                  color: Colors.blue,
                                  blurRadius: 10.0,
                                  offset: Offset(5.0, 5.0),
                                ),
                              ],)),
                        ],
                      ),
                      Icon(Icons.unfold_more, size: 20.0)
                    ],
                  ),
                  color: Color.fromRGBO(210, 255, 77, 1), 
                  height: 30,
                ),
                Expanded(
                  child: Container(child: _tabBarView, color: Colors.yellow[50]),
                ),
              ],
            ),
          )),
    );
  }
}

class DemoTab extends StatefulWidget {
  DemoTab({this.parentController});

  final ScrollController parentController;

  DemoTabState createState() => DemoTabState();
}

class DemoTabState extends State<DemoTab> with AutomaticKeepAliveClientMixin<DemoTab> {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  ScrollController _scrollController;

  ScrollPhysics ph;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: UniqueKey(),
      controller: _scrollController,
      itemBuilder: (b, i) {
        return Container(
          height: 1000,
          margin: EdgeInsets.only(bottom: 3, left: 10),
          alignment: Alignment.topCenter,
          child: Text(
            "\nI will fight, I will fight for you \n" +
            "\nI will fight, I will fight for you \n" +
            "I always do until my heart is black and blue \n" +
            "And I will stay, I will stay with you \n" +
            "We'll make it to the other side like lovers do \n" +
             
            "[Pre-Chorus] \n" +
            "I'll reach my hands out in the dark and \n" +
            "Wait for yours to interlock \n" +
            "I'll wait for you, I'll wait for you \n" +
             
            "[Chorus] \n" +
            "'Cause I'm not givin' up \n" +
            "I'm not givin' up, givin' up, no, not yet (Not yet) \n" +
            "Even when I'm down on my last breath (Last breath) \n" +
            "Even when they say there's nothin' left (Nothin' left) \n" +
            "So don't give up on \n" +
            "I'm not givin' up \n" +
            "I'm not givin' up, givin' up, no, not me (Not me) \n" +
            "Even when nobody else believes (Believes) \n" +
            "I'm not goin' down that easily \n" +
            "So don't give up on me \n" +
             
            "[Verse 2] \n" +
            "And I will hold, I'll hold onto you \n" +
            "No matter what this world will throw \n" +
            "It won't shake me loose \n" +
             
            "[Pre-Chorus] \n" +
            "I'll reach my hands out in the dark and \n" +
            "Wait for yours to interlock \n" +
            "I'll wait for you, I'll wait for you \n" +
             
            "[Chorus] \n" +
            "'Cause I'm not givin' up \n" +
            "I'm not givin' up, givin' up, no, not yet (Not yet) \n" +
            "Even when I'm down on my last breath (Last breath) \n" +
            "Even when they say there's nothin' left (Nothin' left) \n" +
            "So don't give up on \n" +
            "I'm not givin' up \n" +
            "I'm not givin' up, givin' up, no, not me (Not me) \n" +
            "Even when nobody else believes (Believes) \n" +
            "I'm not goin' down that easily \n" +
            "So don't give up on me \n" +
             
            "[Outro] \n" +
            "I will fight, I will fight for you \n" +
            "I always do until my heart is black and blue \n"
          ),

        );
      },
      itemCount: 1,
    );
  }
}

