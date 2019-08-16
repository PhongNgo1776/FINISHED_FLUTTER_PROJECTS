
import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:carryon/chewie_list_item.dart';
import 'package:toast/toast.dart';
import 'dart:async';
import 'package:carryon/ads.dart';

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
  var isShow = true;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network('https://phongngo1776.github.io/Videos/CarryOn/CarryOn.mp4')
    ..addListener(() {
        final bool isPlaying = _videoPlayerController.value.isPlaying;
        if(isPlaying){
          Ads.showInterstitialAd();
          // new Timer(const Duration(milliseconds: 500000), () {
          //   setState(() {
          //     myInterstitial.dispose();
          //   });
          // });
        } else {
          Ads.hideInterstitialAd();
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
        title: Text('Carry On "POKÉMON Detective Pikachu"'),
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
                      color: Colors.yellow[50],
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
            "\nI, I can't lie \n" +
            "I'm scared to open my eyes \n" +
            "'Cause what if I find nothing at all? \n" +
            "Nothing at all \n" +
            "What is the point of my lips \n" +
            "If they don't make noise? Oh \n" +
            "What is the point of doing nothing at all? \n" +
            "Watching it fall \n \n" +

            "The flicker burning \n" +
            "You know the time's running, running out \n" +
            "Only I see all the diamonds, diamonds \n" +
            "Breaking down \n" +
            "I won't stay quiet, I won't stay quiet \n" +
            "'Cause staying silent's the same as dying \n" +
            "I won't stay quiet, the flicker's burning low \n \n" +

            "This is not a, this is not a \n" +
            "Swan, swan song \n" +
            "This is not a, this is not a \n" +
            "Swan, swan song \n" +
            "We just gotta, we just gotta hold on tonight \n" +
            "This is not a, this is not a \n" +
            "Swan song, swan song \n" +
            "Swan dive (Yeah) \n" +
            "It's a new life \n \n" +

            "Real fantasy \n" +
            "Wishing it was make-believe, oh \n" +
            "What is the reason of doing nothing at all? \n" +
            "Watching it fall \n \n" +

            "The flicker burning \n" +
            "You know the time's running, running out \n" +
            "Only I see all the diamonds, diamonds \n" +
            "Breaking down \n" +
            "I won't stay quiet, I won't stay quiet \n" +
            "'Cause staying silent's the same as dying \n" +
            "I won't stay quiet, the flicker's burning low \n \n" +

            "This is not a, this is not a \n" +
            "Swan, swan song \n" +
            "This is not a, this is not a \n" +
            "Swan, swan song \n" +
            "We just gotta, we just gotta hold on tonight \n" +
            "This is not a, this is not a \n" +
            "Swan song, swan song \n" +
            "Swan dive (Yeah) \n" +
            "It's a new life \n \n" +

            "Tread heavily around me \n" +
            "Tread heavily around me \n" +
            "Tread heavily \n" +
            "Tread heavily around me \n" +
            "Tread heavily \n" +
            "Tread— \n \n" +

            "This is not a, this is not a \n" +
            "Swan (Tread heavily), swan song (Tread) \n" +
            "This is not a, this is not a \n" +
            "Swan (Tread heavily), swan song (Tread) \n" +
            "We just gotta, we just gotta hold on tonight (Tread heavily) \n" +
            "This is not a, this is not a \n" +
            "Swan song, swan song \n" +
            "Swan dive (Yeah) \n" +
            "It's a new life \n \n" +

            "It's a new life",
          ),

        );
      },
      itemCount: 1,
    );
  }
}


// /////////////-------------ADMOB----------------------

// MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
//   contentUrl: 'https://flutter.io',
//   childDirected: false,
//   designedForFamilies: false,
//   gender: MobileAdGender.unknown, // or MobileAdGender.female, MobileAdGender.unknown
//   testDevices: <String>[], // Android emulators are considered test devices
// );

// BannerAd myBanner = BannerAd(
//   // Replace the testAdUnitId with an ad unit id from the AdMob dash.
//   // https://developers.google.com/admob/android/test-ads
//   // https://developers.google.com/admob/ios/test-ads
//   adUnitId: "ca-app-pub-6420987903580707/6262017870",
//   size: AdSize.mediumRectangle,
//   targetingInfo: targetingInfo,
//   listener: (MobileAdEvent event) {
//     print("BannerAd event is $event");
//   },
// );

// InterstitialAd myInterstitial = InterstitialAd(
//   adUnitId: "ca-app-pub-6420987903580707/5664000509",
//   targetingInfo: targetingInfo,
//   listener: (MobileAdEvent event) {
//     print("InterstitialAd event is $event");
//   },
// );

// RewardedVideoAd.instance.load("ca-app-pub-6420987903580707/5911498235", targetingInfo);
