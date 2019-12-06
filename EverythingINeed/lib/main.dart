import 'package:flutter/material.dart';
import 'package:sweverythingineed/ads.dart';
import 'package:video_player/video_player.dart';
import 'package:sweverythingineed/chewie_list_item.dart';

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

    _videoPlayerController = VideoPlayerController.network('https://phongngo1776.github.io/Videos/EverythingINeed/EverythingINeed.mp4')
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
        title: Text('Everything I Need - Skylar Grey', style: TextStyle(color: Colors.yellowAccent),),
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
            "\n Born on the wrong side of the ocean \n " +
            "With all the tides against you \n " +
            "You never thought you'd be much good for anyone \n " +
            "But that's so far from the truth \n " +
            " \n " +
            "I know there's pain in your heart \n " +
            "And you're covered in scars \n " +
            "Wish you could see what I do \n " +
            " \n " +
            "'Cause baby, everything you are \n " +
            "Is everything I need \n " +
            "You're everything to me \n " +
            "Baby, every single part \n " +
            "Is who you're meant to be \n " +
            "'Cause you were meant for me \n " +
            "And you're everything I need \n " +
            " \n " +
            "You can say I'm wrong \n " +
            "You can turn your back against me \n " +
            "But I am here to stay \n " +
            "(I am here to stay) \n " +
            "Like the sea \n " +
            "She keeps kissing the shoreline \n " +
            "No matter how many times he pushes her away \n " +
            " \n " +
            "'Cause baby, everything you are \n " +
            "Is everything I need \n " +
            "You're everything to me \n " +
            "Baby, every single part \n " +
            "Is who you're meant to be \n " +
            "'Cause you were meant for me \n " +
            " \n " +
            "And everything happens for a reason \n " +
            "It's all a blessing in disguise \n " +
            "I used to question who I was \n " +
            "But now I see \n " +
            "The answer's in your eyes \n " +
            " \n " +
            "'Cause baby, everything you are \n " +
            "Is everything I need \n " +
            "You're everything to me \n " +
            "Baby, every single part \n " +
            "Is who you're meant to be \n " +
            "'Cause you were meant for me \n " +
            "And you're everything I need \n "
          ),

        );
      },
      itemCount: 1,
    );
  }
}
