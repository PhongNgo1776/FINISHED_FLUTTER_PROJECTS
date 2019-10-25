import 'package:flutter/material.dart';
import 'package:swnopromises/ads.dart';
import 'package:video_player/video_player.dart';
import 'package:swnopromises/chewie_list_item.dart';

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

    _videoPlayerController = VideoPlayerController.network('https://phongngo1776.github.io/Videos/NoPromises/NoPromises.mp4')
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
        title: Text('No Promises - Shayne Ward', style: TextStyle(color: Colors.yellowAccent),),
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
          height: 1300,
          margin: EdgeInsets.only(bottom: 3, left: 10),
          alignment: Alignment.topCenter,
          child: Text(
            "\nHey baby, when we are together, doing things that we love \n " +
            "Every time you're near I feel like I'm in heaven, feeling high \n " +
            "I don't want to let go, girl \n " +
            "I just need you to know girl \n " +
            " \n " +
            "I don't wanna run away, baby you're the one I need tonight \n " +
            "No promises \n " +
            "Baby, now I need to hold you tight, I just wanna die in your arms \n " +
            " \n " +
            "Here tonight \n " +
            " \n " +
            "Hey baby, when we are together, doing things that we love \n " +
            "Everytime you're near I feel like I'm in heaven, feeling high \n " +
            "I don't want to let go, girl \n " +
            "I just need you you to know girl \n " +
            " \n " +
            "I don't wanna run away, baby you're the one I need tonight \n " +
            "No promises \n " +
            "Baby, now I need to hold you tight, I just wanna die in your arms \n " +
            " \n " +
            "I don't want to run away, I want to stay forever, thru Time and Time \n " +
            "No promises \n " +
            " \n " +
            "I don't wanna run away, I don't wanna be alone \n " +
            "No Promises \n " +
            "Baby, now I need to hold you tight, now and forever my love \n " +
            " \n " +
            "No promises \n " +
            "I don't wanna run away, baby you're the one I need tonight \n " +
            "No promises \n " +
            "Baby, now I need to hold you tight, I just wanna die in your arms \n " +
            "I don't wanna run away, baby you're the one I need tonight \n " +
            "No promises \n " +
            "Baby, now I need to hold you tight, I just wanna die in your arms \n " +
            "Here tonight \n "
          ),

        );
      },
      itemCount: 1,
    );
  }
}
