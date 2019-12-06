import 'package:flutter/material.dart';
import 'package:swhowfarillgo2/ads.dart';
import 'package:swhowfarillgo2/chewie_list_item.dart';
import 'package:video_player/video_player.dart';

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

    _videoPlayerController = VideoPlayerController.network('https://phongngo1776.github.io/Videos/HowFarIllGo/HowFarIllGo.mp4')
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
        title: Text('Auli\'i Cravalho - How Far I\'ll Go', style: TextStyle(color: Colors.yellowAccent),),
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
            "I've been staring at the edge of the water\n" + 
            "'Long as I can remember\n" + 
            "Never really knowing why\n" + 
            "I wish I could be the perfect daughter\n" + 
            "But I come back to the water\n" + 
            "No matter how hard I try\n" + 
            "\n" + 
            "Every turn I take\n" + 
            "Every trail I track\n" + 
            "Every path I make\n" + 
            "Every road leads back\n" + 
            "To the place I know where I cannot go\n" + 
            "Where I long to be\n" + 
            "\n" + 
            "See the line where the sky meets the sea?\n" + 
            "It calls me\n" + 
            "And no one knows\n" + 
            "How far it goes\n" + 
            "\n" + 
            "If the wind in my sail on the sea stays behind me\n" + 
            "One day I'll know\n" + 
            "If I go there's just no telling how far I'll go\n" + 
            "\n" + 
            "I know everybody on this island\n" + 
            "Seems so happy on this island\n" + 
            "Everything is by design\n" + 
            "I know everybody on this island\n" + 
            "Has a role on this island\n" + 
            "So maybe I can roll with mine\n" + 
            "\n" + 
            "I can lead with pride\n" + 
            "I can make us strong\n" + 
            "I'll be satisfied if I play along\n" + 
            "But the voice inside sings a different song\n" + 
            "What is wrong with me?\n" + 
            "\n" + 
            "See the light as it shines on the sea?\n" + 
            "It's blinding\n" + 
            "But no one knows\n" + 
            "How deep it goes\n" + 
            "\n" + 
            "And it seems like it's calling out to me\n" + 
            "So come find me\n" + 
            "And let me know\n" + 
            "What's beyond that line?\n" + 
            "Will I cross that line?\n" + 
            "\n" + 
            "And the line where the sky meets the sea\n" + 
            "It calls me\n" + 
            "And no one knows\n" + 
            "How far it goes\n" + 
            "\n" + 
            "If the wind in my sail on the sea stays behind me\n" + 
            "One day I'll know\n" + 
            "How far I'll go\n" 
          ),

        );
      },
      itemCount: 1,
    );
  }
}
