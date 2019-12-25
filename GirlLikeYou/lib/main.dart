import 'package:flutter/material.dart';
import 'package:swgirllikeyou/ads.dart';
import 'package:video_player/video_player.dart';
import 'package:swgirllikeyou/chewie_list_item.dart';

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

    _videoPlayerController = VideoPlayerController.network('https://phongngo1776.github.io/Videos/GirlLikeYou/GirlLikeYou.mp4')
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
        title: Text('Girls Like You - Maroon 5', style: TextStyle(color: Colors.yellowAccent),),
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
                      height: 270, 
                      color: Colors.black,
                      child: Container(
                              margin: EdgeInsets.only(top: 35),
                              color: Colors.black,
                              child: ChewieListItem(
                              videoPlayerController: _videoPlayerController,
                              looping: false,
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
          height: 1300,
          margin: EdgeInsets.only(bottom: 3, left: 10),
          alignment: Alignment.topCenter,
          child: Text(
            "\n Spent 24 hours, I need more hours with you \n " +
            "You spent the weekend getting even, ooh \n " +
            "We spent the late nights making things right between us \n " +
            " \n " +
            "But now it's all good, babe \n " +
            "Roll that back wood, babe \n " +
            "And play me close \n " +
            " \n " +
            "'Cause girls like you run 'round with guys like me \n " +
            "'Til sun down when I come through \n " +
            "I need a girl like you, yeah yeah \n " +
            "Girls like you love fun and, yeah, me too \n " +
            "What I want when I come through \n " +
            "I need a girl like you, yeah yeah \n " +
            " \n " +
            "Yeah yeah yeah, yeah yeah yeah \n " +
            "I need a girl like you, yeah yeah \n " +
            "Yeah yeah yeah, yeah yeah yeah \n " +
            "I need a girl like you \n " +
            " \n " +
            "I spent last night on the last flight to you (ey ya) \n " +
            "Took a whole day up trying to get way up, ooh \n " +
            "We spent the daylight trying to make things right between us \n " +
            " \n " +
            "But now it's all good, babe \n " +
            "Roll that back wood, babe \n " +
            "And play me close, yeah \n " +
            " \n " +
            "'Cause girls like you run 'round with guys like me \n " +
            "'Til sun down when I come through \n " +
            "I need a girl like you, yeah yeah \n " +
            "Girls like you love fun and, yeah, me too \n " +
            "What I want when I come through \n " +
            "I need a girl like you, yeah yeah \n " +
            " \n " +
            "Yeah yeah yeah, yeah yeah yeah \n " +
            "I need a girl like you, yeah yeah \n " +
            "Yeah yeah yeah, yeah yeah yeah \n " +
            "I need a girl like you, yeah yeah \n " +
            "I need a girl like you, yeah yeah \n " +
            "I need a girl like you \n " +
            " \n " +
            "Maybe it's 6:45 \n " +
            "Maybe I'm barely alive \n " +
            "Maybe you've taken my shit for the last time, yeah \n " +
            "Maybe I know that I'm drunk \n " +
            "Maybe I know you're the one \n " +
            "Maybe you thinking it's better if you drive \n " +
            " \n " +
            "Oh, 'cause girls like you run 'round with guys like me \n " +
            "'Til sun down when I come through \n " +
            "I need a girl like you, yeah \n " +
            " \n " +
            "'Cause girls like you run 'round with guys like me \n " +
            "'Til sun down when I come through \n " +
            "I need a girl like you, yeah yeah \n " +
            "Girls like you love fun and, yeah, me too \n " +
            "What I want when I come through \n " +
            "I need a girl like you, yeah yeah \n " +
            " \n " +
            "Yeah yeah yeah, yeah yeah yeah \n " +
            "I need a girl like you, yeah yeah \n " +
            "Yeah yeah yeah, yeah yeah yeah \n " +
            "I need a girl like you \n "
          ),

        );
      },
      itemCount: 1,
    );
  }
}
