import 'package:flutter/material.dart';
import 'package:swletmeloveyou/ads.dart';
import 'package:video_player/video_player.dart';
import 'package:swletmeloveyou/chewie_list_item.dart';

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

    _videoPlayerController = VideoPlayerController.network('https://phongngo1776.github.io/Videos/LetMeLoveYou/LetMeLoveYou.mp4')
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
        title: Text('Let Me Love You - Justin Bieber', style: TextStyle(color: Colors.yellowAccent),),
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
                              margin: EdgeInsets.only(top: 30),
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
          height: 1300,
          margin: EdgeInsets.only(bottom: 3, left: 10),
          alignment: Alignment.topCenter,
          child: Text(
            "\nI used to believe\n" +
            "We were burnin on the edge of somethin beautiful\n" +
            "Somethin beautiful\n" +
            "Selling a dream\n" +
            "Smoke and mirrors keep us waitin on a miracle\n" +
            "On a miracle\n" +
            "Say go through the darkest of days\n" +
            "Heaven′s a heartbreak away\n" +
            "Never let you go never let me down\n" +
            "Oh It is been a hell of a ride\n" +
            "\n" +
            "Driving the edge of a knife\n" +
            "Never let you go never let me down\n" +
            "Don′t you give up nah nah nah\n" +
            "I won′t give up nah nah nah\n" +
            "Let me love you let me love you\n" +
            "Don′t you give up nah nah nah\n" +
            "I won′t give up nah nah nah\n" +
            "Let me love you let me love you\n" +
            "Oh baby baby\n" +
            "Don′t fall asleep\n" +
            "At the whel we′ve got a million miles ahead of us\n" +
            "Miles ahead of us\n" +
            "All that we need\n" +
            "Is a rude awakening to know We are good enough yeah\n" +
            "Know We are good enough\n" +
            "Say go through the darkest of days\n" +
            "\n" +
            "Heaven′s a heartbreak away\n" +
            "Never let you go never let me down\n" +
            "Oh It is been a hell of a ride\n" +
            "Driving the edge of a knife\n" +
            "Never let you go never let me down\n" +
            "Don′t you give up nah nah nah\n" +
            "I won′t give up nah nah nah\n" +
            "Let me love you let me love you\n" +
            "Don′t you give up nah nah nah\n" +
            "I won′t give up nah nah nah\n" +
            "Let me love you let me love you\n" +
            "\n" +
            "Oh baby baby\n" +
            "Never let you go never let you down girl\n" +
            "Never let you go never let you down girl\n" +
            "Never let you go\n" +
            "Girl never let you go\n" +
            "Never let you go never let you down girl\n" +
            "Never let you go never let you down girl\n" +
            "Never let you go\n" +
            "\n" +
            "Yeah yeah girl never let you go\n" +
            "Don′t you give up nah nah nah\n" +
            "I won′t give up nah nah nah\n" +
            "Let me love you let me love you\n" +
            "Don′t you give up nah nah nah\n" +
            "I won′t give up nah nah nah\n" +
            "Let me love you let me love you\n" +
            "\n "
          ),

        );
      },
      itemCount: 1,
    );
  }
}
