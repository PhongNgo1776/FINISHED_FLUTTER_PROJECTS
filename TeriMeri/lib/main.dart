import 'package:flutter/material.dart';
import 'package:swterimeri/ads.dart';
import 'package:video_player/video_player.dart';
import 'package:swterimeri/chewie_list_item.dart';

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

    _videoPlayerController = VideoPlayerController.network('https://phongngo1776.github.io/Videos/TeriMeri/TeriMeri.mp4')
    ..addListener(() {
        final bool isPlaying = _videoPlayerController.value.isPlaying;
        if(isPlaying){
          if(!isFirstTime){
            Ads.showInterstitialAd();
          }

          isFirstTime = false;
        } else {
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
        title: Text('Teri Meri - Prem Kahani - Bodyguard', style: TextStyle(color: Colors.yellowAccent),),
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
          height: 1600,
          margin: EdgeInsets.only(bottom: 3, left: 10),
          alignment: Alignment.topCenter,
          child: Text(
            "\nAa ..\n" + 
            "\n" + 
            "Teri Meri, Meri Teri Prem Kahani Hai Mushkil\n" + 
            "Yours and Mine, Mine and Yours, Our Love Story is tough \n" + 
            "Do Lafzon Mein Yeh Bayaan Na Ho Paaye\n" + 
            "It can't be Expressed in Just a couple of Verses\n" + 
            "Ik Ladka, Ik Ladki Ki Yeh Kahani Hai Nayi\n" + 
            "This is a new kind of Story of a Boy and a Girl\n" + 
            "Do Lafzon Mein Yeh Bayaan Na Ho Paaye\n" + 
            "It can't be Expressed in Just a couple of Verses\n" + 
            "\n" + 
            "Teri Meri, Meri Teri Prem Kahani Hai Mushkil\n" + 
            "Yours and Mine, Mine and Yours, Our Love Story is tough \n" + 
            "Do Lafzon Mein Yeh Bayaan Na Ho Paaye\n" + 
            "It can't be Expressed in Just a couple of Verses\n" + 
            "Ik Dooje Se Hue Judaa, Jab Ik Dooje Ke Liye Bane\n" + 
            "We are separated from one-another, even if We are made for each-other\n" + 
            "Teri Meri, Meri Teri Prem Kahani Hai Mushkil\n" + 
            "Yours and Mine, Mine and Yours, Our Love Story is tough \n" + 
            "Do Lafzon Mein Yeh Bayaan Na Ho Paaye\n" + 
            "It can't be Expressed in Just a couple of Verses\n" + 
            "\n" + 
            "Aa ..\n" + 
            "\n" + 
            "Tumse Dil Jo Lagaya, Toh Jahaan Maine Paaya\n" + 
            "On giving You my Heart, I got the World in return\n" + 
            "Kabhi Socha Na Tha Yun, Meelon Door Hoga Saaya\n" + 
            "But I never thought that even Your Shadow would be miles away\n" + 
            "Kyun Khuda Tune Mujhe Aisa Khwaab Dikhaya\n" + 
            "Why Oh God! You gave me such a Dream\n" + 
            "Jab Haqeeqat Mein Usse Todna Tha\n" + 
            "Because it was Sure to Break in Reality\n" + 
            "\n" + 
            "Aa ..\n" + 
            "\n" + 
            "Ik Dooje Se Hue Judaa, Jab Ik Dooje Ke Liye Bane\n" + 
            "We are separated from one-another, even if We are made for each-other\n" + 
            "Teri Meri, Meri Teri Prem Kahani Hai Mushkil\n" + 
            "Yours and Mine, Mine and Yours, Our Love Story is tough \n" + 
            "Do Lafzon Mein Yeh Bayaan Na Ho Paaye\n" + 
            "It can't be Expressed in Just a couple of Verses\n" + 
            "\n" + 
            "Teri Meri Baaton Ka Har Lamha Sab Se Anjaana\n" + 
            "Every moment of Our Conversations is not known to any one else\n" + 
            "Do Lafzon Mein Yeh Bayaan Na Ho Paaye\n" + 
            "It can't be Expressed in Just a couple of Verses\n" + 
            "Har Ehsaas Mein Tu Hai, Har Ik Yaad Mein Tera Afsaana\n" + 
            "You're in each and every feeling, You're there in each one of my thoughts\n" + 
            "Do Lafzon Mein Yeh Bayaan Na Ho Paaye\n" + 
            "It can't be Expressed in Just a couple of Verses\n" + 
            "\n" + 
            "Aa ..\n" + 
            "\n" + 
            "Saara Din Bit Jaaye, Saari Raat Jagaaye\n" + 
            "The whole day passes away, the night keeps me awake\n" + 
            "Bas Khayal Tumhara, Lamha Lamha Tadpaaye\n" + 
            "Just the thought of Yours, troubles me every moment\n" + 
            "Yeh Tadap Keh Rahi Hai Mit Jaaye Faasle\n" + 
            "This unbearable longing for You wishes to end all distance\n" + 
            "Yeh Tere Mere Darmeyaan Hai Jo Saare\n" + 
            "That remain between Us\n" + 
            "\n" + 
            "Ik Dooje Se Hue Judaa, Jab Ik Dooje Ke Liye Bane\n" + 
            "We are separated from one-another, even if We are made for each-other\n" + 
            "Teri Meri Baaton Ka Har Lamha Sab Se Anjaana\n" + 
            "Every moment of Our Conversations is not known to any one else\n" + 
            "Do Lafzon Mein Yeh Bayaan Na Ho Paaye\n" + 
            "It can't be Expressed in Just a couple of Verses\n" + 
            "Har Ehsaas Mein Tu Hai, Har Ik Yaad Mein Tera Afsaana\n" + 
            "You're in each and every feeling, You're there in each one of my thoughts\n" + 
            "Do Lafzon Mein Yeh Bayaan Na Ho Paaye\n" + 
            "It can't be Expressed in Just a couple of Verses\n" + 
            "\n" + 
            "Teri Meri, Meri Teri Prem Kahani Hai Mushkil\n" + 
            "Yours and Mine, Mine and Yours, Our Love Story is tough \n" + 
            "Do Lafzon Mein Yeh Bayaan Na Ho Paaye\n" + 
            "It can't be Expressed in Just a couple of Verses\n"
          ),

        );
      },
      itemCount: 1,
    );
  }
}
