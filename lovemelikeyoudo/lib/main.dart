import 'package:flutter/material.dart';
import 'package:speechless/ads.dart';
import 'package:video_player/video_player.dart';
import 'package:speechless/chewie_list_item.dart';

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

    _videoPlayerController = VideoPlayerController.network('https://phongngo1776.github.io/Videos/Love_Me_Like_You_Do/Love_Me_Like_You_Do.mp4')
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
        title: Text('Love Me Like You Do - Ellie Goulding', style: TextStyle(color: Colors.yellowAccent),),
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
            "\nYou're the light, you're the night \n" +
            "You're the colour of my blood \n" +
            "You're the cure, you're the pain \n" +
            " \n" +
            "You're the only thing I wanna touch \n" +
            "Never knew that it could mean so much, so much \n" +
            " \n" +
            "You're the fear, I don't care \n" +
            "'Cause I've never been so high \n" +
            "Follow me through the dark \n" +
            "Let me take you past our satellites \n" +
            "You can see the world you brought to life, to life \n" +
            " \n" +
            "So love me like you do, la-la-love me like you do \n" +
            "Love me like you do, la-la-love me like you do \n" +
            "Touch me like you do, ta-ta-touch me like you do \n" +
            "What are you waiting for? \n" +
            " \n" +
            "Fading in, fading out \n" +
            "On the edge of paradise \n" +
            "Every inch of your skin is a Holy Grail I've got to find \n" +
            "Only you can set my heart on fire, on fire \n" +
            "Yeah \n" +
            " \n" +
            "I'll let you set the pace \n" +
            "'Cause I'm not thinking straight \n" +
            "My head's spinning around, I can't see clear no more \n" +
            "What are you waiting for? \n" +
            " \n" +
            "Love me like you do, la-la-love me like you do (Like you do) \n" +
            "Love me like you do, la-la-love me like you do \n" +
            "Touch me like you do, ta-ta-touch me like you do \n" +
            "What are you waiting for? \n" +
            "Love me like you do, la-la-love me like you do (Like you do) \n" +
            "Love me like you do, la-la-love me like you do (Yeah) \n" +
            "Touch me like you do, ta-ta-touch me like you do \n" +
            "What are you waiting for? \n" +
            " \n" +
            "I'll let you set the pace \n" +
            "'Cause I'm not thinking straight \n" +
            "My head's spinning around, I can't see clear no more \n" +
            "What are you waiting for? \n" +
            " \n" +
            "Love me like you do, la-la-love me like you do (Like you do) \n" +
            "Love me like you do, la-la-love me like you do (Yeah) \n" +
            "Touch me like you do, ta-ta-touch me like you do \n" +
            "What are you waiting for? \n" +
            "Love me like you do, la-la-love me like you do (Like you do) \n" +
            "Love me like you do, la-la-love me like you do (Oh) \n" +
            "Touch me like you do, ta-ta-touch me like you do \n" +
            "What are you waiting for? \n"
          ),

        );
      },
      itemCount: 1,
    );
  }
}
