import 'package:flutter/material.dart';
import 'package:swshowyourself/ads.dart';
import 'package:swshowyourself/chewie_list_item.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
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

    _videoPlayerController = VideoPlayerController.network('https://phongngo1776.github.io/Videos/ShowYourself/ShowYourself.mp4')
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
        title: Text('Show Yourself ft Evan Rachel Wood - Frozen 2', style: TextStyle(color: Colors.yellowAccent),),
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
                    )
                  ]),
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
            "\nEvery inch of me is trembling\n" + 
            "But not from the cold\n" + 
            "Something is familiar\n" + 
            "Like a dream I can reach but not quite hold\n" + 
            "I can sense you there\n" + 
            "Like a friend I've always known\n" + 
            "I'm arriving\n" + 
            "And it feels like I am home\n" + 
            "\n" + 
            "I have always been a fortress\n" + 
            "Hold secrets deep inside\n" + 
            "You have secrets, too\n" + 
            "But you don't have to hide\n" + 
            "\n" + 
            "Show yourself\n" + 
            "I'm dying to meet you\n" + 
            "Show yourself\n" + 
            "It's your turn\n" + 
            "Are you the one I've been looking for\n" + 
            "\n" + 
            "All of my life?\n" + 
            "Show yourself\n" + 
            "I'm ready to learn\n" + 
            "Ah-ah, ah-ah\n" + 
            "Ah-ah, ah-ah-ah\n" + 
            "\n" + 
            "I've never felt so certain\n" + 
            "All my life I've been torn\n" + 
            "But I'm here for a reason\n" + 
            "Could it be the reason I was born?\n" + 
            "I have always been so different\n" + 
            "Normal rules did not apply\n" + 
            "Is this the day?\n" + 
            "Are you the way\n" + 
            "I finally find out why?\n" + 
            "\n" + 
            "Show yourself\n" + 
            "I'm no longer trembling\n" + 
            "Here I am\n" + 
            "I've come so far\n" + 
            "You are the answer I've waited for\n" + 
            "All of my life\n" + 
            "Oh, show yourself\n" + 
            "Let me see who you are\n" + 
            "\n" + 
            "Come to me now\n" + 
            "Open your door\n" + 
            "Don't make me wait\n" + 
            "One moment more\n" + 
            "Oh, come to me now\n" + 
            "Open your door\n" + 
            "Don't make me wait\n" + 
            "One moment more\n" + 
            "\n" + 
            "Where the north wind meets the sea\n" + 
            "Ah-ah, ah-ah\n" + 
            "There's a river\n" + 
            "Ah-ah, ah-ah\n" + 
            "Full of memory (memories, memories)\n" + 
            "Come, my darling, homeward bound\n" + 
            "I am found\n" + 
            "\n" + 
            "Show yourself\n" + 
            "Step into the power\n" + 
            "Grow yourself\n" + 
            "Into something new\n" + 
            "\n" + 
            "You are the one you've been waiting for\n" + 
            "All of my life\n" + 
            "All of your life\n" + 
            "Oh, show yourself\n" + 
            "\n" + 
            "Ah-ah, ah-ah\n" + 
            "Ah-ah, ah-ah\n" + 
            "Ah-ah, ah-ah\n"
          ),

        );
      },
      itemCount: 1,
    );
  }
}
