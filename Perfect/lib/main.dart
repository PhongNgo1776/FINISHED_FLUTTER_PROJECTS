import 'package:flutter/material.dart';
import 'package:swperfect/ads.dart';
import 'package:video_player/video_player.dart';
import 'package:swperfect/chewie_list_item.dart';

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

    _videoPlayerController = VideoPlayerController.network('https://phongngo1776.github.io/Videos/Perfect/Perfect.mp4')
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
        title: Text('Ed Sheeran - Perfect', style: TextStyle(color: Colors.yellowAccent),),
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
            "\nI found a love for me\n" +
            "Oh darling, just dive right in and follow my lead\n" +
            "Well, I found a girl, beautiful and sweet\n" +
            "Oh, I never knew you were the someone waiting for me\n" +
            "'Cause we were just kids when we fell in love\n" +
            "Not knowing what it was\n" +
            "I will not give you up this time\n" +
            "But darling, just kiss me slow, your heart is all I own\n" +
            "And in your eyes, you're holding mine\n" +
            "\n" +
            "Baby, I'm dancing in the dark with you between my arms\n" +
            "Barefoot on the grass, listening to our favourite song\n" +
            "When you said you looked a mess, I whispered underneath my breath\n" +
            "But you heard it, darling, you look perfect tonight\n" +
            "\n" +
            "Well I found a woman, stronger than anyone I know\n" +
            "She shares my dreams, I hope that someday I'll share her home\n" +
            "I found a love, to carry more than just my secrets\n" +
            "To carry love, to carry children of our own\n" +
            "We are still kids, but we're so in love\n" +
            "Fighting against all odds\n" +
            "I know we'll be alright this time\n" +
            "Darling, just hold my hand\n" +
            "Be my girl, I'll be your man\n" +
            "I see my future in your eyes\n" +
            "\n" +
            "Baby, I'm dancing in the dark, with you between my arms\n" +
            "Barefoot on the grass, listening to our favorite song\n" +
            "When I saw you in that dress, looking so beautiful\n" +
            "I don't deserve this, darling, you look perfect tonight\n" +
            "\n" +
            "Baby, I'm dancing in the dark, with you between my arms\n" +
            "Barefoot on the grass, listening to our favorite song\n" +
            "I have faith in what I see\n" +
            "Now I know I have met an angel in person\n" +
            "And she looks perfect\n" +
            "I don't deserve this\n" +
            "You look perfect tonight\n"
          ),

        );
      },
      itemCount: 1,
    );
  }
}
