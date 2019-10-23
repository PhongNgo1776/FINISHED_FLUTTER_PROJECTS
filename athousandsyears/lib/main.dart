import 'package:flutter/material.dart';
import 'package:sw1000years/ads.dart';
import 'package:video_player/video_player.dart';
import 'package:sw1000years/chewie_list_item.dart';

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

    _videoPlayerController = VideoPlayerController.network('https://phongngo1776.github.io/Videos/AThousandsYears/AThousandsYears.mp4')
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
        title: Text('A Thousands Years - Christina Perri', style: TextStyle(color: Color.fromRGBO(210, 255, 77, 1)),),
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
                      height: 250, 
                      color: Colors.black,
                      child: ChewieListItem(
                              videoPlayerController: _videoPlayerController,
                              looping: true,
                            ),
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
            "\nHeart beats fast \n " +
            "Colors and promises \n " +
            "How to be brave? \n " +
            "How can I love when I'm afraid to fall? \n " +
            "But watching you stand alone \n " +
            "All of my doubt suddenly goes away somehow \n " +
            "One step closer \n " +
            " \n " +
            "I have died everyday waiting for you \n " +
            "Darling don't be afraid I have loved you \n " +
            "For a thousand years \n " +
            "I'll love you for a thousand more \n " +
            " \n " +
            "Time stands still \n " +
            "Beauty in all she is \n " +
            "I will be brave \n " +
            "I will not let anything take away \n " +
            "What's standing in front of me \n " +
            "Every breath \n " +
            "Every hour has come to this \n " +
            "One step closer \n " +
            " \n " +
            "I have died everyday waiting for you \n " +
            "Darling don't be afraid I have loved you \n " +
            "For a thousand years \n " +
            "I'll love you for a thousand more \n " +
            " \n " +
            "And all along I believed I would find you \n " +
            "Time has brought your heart to me \n " +
            "I have loved you for a thousand years \n " +
            "I'll love you for a thousand more \n " +
            "One step closer \n " +
            "One step closer \n " +
            " \n " +
            "I have died everyday waiting for you \n " +
            "Darling don't be afraid I have loved you \n " +
            "For a thousand years \n " +
            "I'll love you for a thousand more \n " +
            " \n " +
            "And all along I believed I would find you \n " +
            "Time has brought your heart to me \n " +
            "I have loved you for a thousand years \n " +
            "I'll love you for a thousand more \n " 
          ),

        );
      },
      itemCount: 1,
    );
  }
}
