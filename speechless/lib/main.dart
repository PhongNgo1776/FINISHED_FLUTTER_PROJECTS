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

    _videoPlayerController = VideoPlayerController.network('https://phongngo1776.github.io/Videos/Speechless/1.mp4')
    ..addListener(() {
        final bool isPlaying = _videoPlayerController.value.isPlaying;
        if(isPlaying){
          if(isFirstTime){
            Ads.hideInterstitialAd();
          } else {
            Ads.showInterstitialAd();
          }

          isFirstTime = false;
          
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
        title: Text('Naomi Scott - Speechless', style: TextStyle(color: Colors.yellowAccent),),
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
            "\nHere comes a wave \n" +
            "Meant to wash me away \n" +
            "A tide that is taking me under \n \n" +

            "Swallowing sand \n" +
            "Left with nothing to say \n" +
            "My voice drowned out in the thunder \n \n" +

            "But I won't cry \n" +
            "And I won't start to crumble \n" +
            "Whenever they try \n" +
            "To shut me or cut me down \n \n" +

            "I won't be silenced \n" +
            "You can't keep me quiet \n" +
            "Won't tremble when you try it \n" +
            "All I know is I won't go speechless \n \n" +

            "'Cause I'll breathe \n" +
            "When they try to suffocate me \n" +
            "Don't you underestimate me \n" +
            "'Cause I know that I won't go speechless \n \n" +

            "Written in stone \n" +
            "Every rule, every word \n" +
            "Centuries old and unbending \n" +
            "Stay in your place \n" +
            "Better seen and not heard \n" +
            "But now that story is ending \n \n" +

            "'Cause I \n" +
            "I cannot start to crumble \n" +
            "So come on and try \n" +
            "Try to shut me and cut me down \n \n" +

            "I won't be silenced \n" +
            "You can't keep me quiet \n" +
            "Won't tremble when you try it \n" +
            "All I know is I won't go speechless \n" +
            "Speechless \n \n" +
            
            "Let the storm in \n" +
            "I cannot be broken \n" +
            "No, I won't live unspoken \n" +
            "'Cause I know that I won't go speechless \n \n" +
            
            "Try to lock me in this cage \n" +
            "I won't just lay me down and die \n" +
            "I will take these broken wings \n" +
            "And watch me burn across the sky \n" +
            "And it echoes saying I \n \n" +
            
            "Won't be silenced \n" +
            "No you will not see me tremble when you try it \n" +
            "All I know is I won't go speechless \n" +
            "Speechless \n \n" +
            
            "'Cause I'll breathe \n" +
            "When they try to suffocate me \n" +
            "Don't you underestimate me \n" +
            "'Cause I know that I won't go speechless \n" +
            "All I know is I won't go speechless \n" +
            "Speechless"
          ),

        );
      },
      itemCount: 1,
    );
  }
}
