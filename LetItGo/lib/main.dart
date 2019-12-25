import 'package:flutter/material.dart';
import 'package:swletitgo/ads.dart';
import 'package:video_player/video_player.dart';
import 'package:swletitgo/chewie_list_item.dart';

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

    _videoPlayerController = VideoPlayerController.network('https://phongngo1776.github.io/Videos/LetItGo/LetItGo.mp4')
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
        title: Text('Let it go - FROZEN', style: TextStyle(color: Colors.yellowAccent),),
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
            "\nThe snow blows white on the mountain tonight \n " +
            "Not a footprint to be seen \n " +
            "A kingdom of isolation, and it looks like I'm the queen \n " +
            "The wind is howling like the swirling storm inside \n " +
            "Couldn't keep it in \n " +
            "Heaven knows I tried \n " +
            " \n " +
            "Don't let them in, don't let them see \n " +
            "Be the good girl, you always have to be \n " +
            "Conceal, don't feel, don't let them know \n " +
            "Well, now they know \n " +
            " \n " +
            "Let it go, let it go \n " +
            "Can't hold it back anymore \n " +
            "Let it go, let it go \n " +
            "Turn my back and slam the door \n " +
            " \n " +
            "And here I stand \n " +
            "And here I'll stay \n " +
            "Let it go, let it go \n " +
            "The cold never bothered me anyway \n " +
            " \n " +
            "It's funny how some distance makes everything seem small \n " +
            "And the fears that once controlled me, can't get to me at all \n " +
            "Up here in the cold, thin air I finally can breathe \n " +
            "I know I left a life behind, but I'm too relieved to grieve \n " +
            " \n " +
            "Let it go, let it go \n " +
            "Can't hold it back anymore \n " +
            "Let it go, let it go \n " +
            "Turn my back, and slam the door \n " +
            " \n " +
            "And here I stand \n " +
            "And here I'll stay \n " +
            "Let it go, let it go \n " +
            "The cold never bothered me anyway \n " +
            " \n " +
            "Standing frozen in the life I've chosen \n " +
            "You won't find me, the past is so behind me \n " +
            "Buried in the snow \n " +
            " \n " +
            "Let it go, let it go \n " +
            "Can't hold it back anymore \n " +
            "Let it go, let it go \n " +
            "Turn my back and slam the door \n " +
            " \n " +
            "And here I stand \n " +
            "And here I'll stay \n " +
            "Let it go, let it go \n " +
            "The cold never bothered me anyway \n " +
            " \n "
          ),

        );
      },
      itemCount: 1,
    );
  }
}
