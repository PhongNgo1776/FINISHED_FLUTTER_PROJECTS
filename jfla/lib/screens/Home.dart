import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swjfla/models/Ads.dart';
import 'package:swjfla/screens/DrawerMenu.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController tabController;
  Widget _tabBarView;
  ScrollController scrollController = ScrollController();
  var isFirstTime = true;
  
  

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        backgroundColor: Colors.white,
        title: new Text('Do you want to exit app?'),
        content: new Text('Are you sure?'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () =>  SystemNavigator.pop(),
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ?? false;
  }

  @override
  void initState() {
    super.initState();
    // Ads.hideBanner2Ad();
    // Ads.hideBanner3Ad();
    // Ads.hideInterstitialAd();

    // Ads.showBannerAd();


    tabController = TabController(
      length: 2,
      vsync: this,
    );
    _tabBarView = TabBarView(children: [
      DemoTab(parentController: scrollController)
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    Ads.hideBannerAd();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.black12, //or set color with: Color(0xFF0000FF)
    ));
    return new WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
      appBar: AppBar(
        title: Text('J.Fla - Newest Cover Songs', style: TextStyle(color: Color.fromRGBO(210, 255, 77, 1)),),
        iconTheme: new IconThemeData(color: Color.fromRGBO(210, 255, 77, 1)),
        backgroundColor: Color.fromRGBO(50, 50, 50, 1),
      ),
      drawer: DrawerMenu(),
      body: NestedScrollView(
          controller: scrollController,
          physics: ScrollPhysics(parent: PageScrollPhysics()),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                    [Container(
                          height: 220, 
                          color: Colors.black87,
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            children: <Widget>[
                              Row(children: <Widget>[
                                Image.asset("images/index.jpg", height: 150, width: 110),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text.rich(TextSpan(
                                      text: 'J.Fla: ', 
                                      style: TextStyle(color: Color.fromRGBO(255, 20, 147, 1), fontWeight: FontWeight.bold),// default text style
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' (Korean: 제이플라, Romanized: Jeipeulla; Birth name: 김정화, Romanized as Kim Jung Hwa or Kim Jeong-Hwa; born June 10, 1987), is a South Korean singer, music artist, songwriter, and YouTuber. She signed with Sony Music Japan, and later Ostereo Records. ', 
                                          style: TextStyle(fontStyle: FontStyle.italic, color: Color.fromRGBO(255, 20, 147, 1), fontWeight: FontWeight.normal)
                                        ),
                                      ]
                                    )
                                  )
                                ),
                                )
                              ]),
                              RaisedButton(
                                color: Colors.yellow,
                                onPressed: () {
                                  Navigator.pushNamed(context, '/listfilms');
                                },
                                child: Text('Watch Videos', style: TextStyle(color: Colors.red),),
                              )
                            ]
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
                          Icon(Icons.format_align_justify, size: 20.0, color: Colors.green),
                          Text("Introduction: ", 
                            style: TextStyle(fontSize: 20, color: Colors.red, 
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.green,
                              decorationStyle: TextDecorationStyle.solid,
                              shadows: [
                                Shadow(
                                  color: Colors.green,
                                  blurRadius: 10.0,
                                  offset: Offset(5.0, 5.0),
                                ),
                              ],)),
                        ],
                      ),
                      Icon(Icons.unfold_more, size: 20.0)
                    ],
                  ),
                  color: Color.fromRGBO(204, 204, 0, 0.5), 
                  height: 30,
                ),
                Expanded(
                  child: Container(child: _tabBarView, color: Colors.yellow[50]),
                ),
              ],
            ),
          )),
    ));
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
          height: 700,
          padding: EdgeInsets.only(left: 10, right: 10),
          color: Colors.black87,
          alignment: Alignment.topCenter,
          child: Text(
            '\nOn August 22, 2011, J.Fla created her YouTube channel, JFlaMusic, and uploaded her first song, a cover of Beyonce\'s "Halo". Over the next five months she uploaded 15 more cover songs.' +
            '\n\nSubsequently, on February 17, 2012, a collection of 8 tracks entitled \"JFla\'s Cover 1\" was released on the internet.' +
            '\n\nIn mid-2013, she released her official debut album, an original EP titled \"바보 같은 Story\".' +
            '\n\nThen, from late 2014 to mid-2016, she released at least six additional EPs (mostly covers of songs in English, but also some original, Korean language songs).' +
            '\n\nEarly in 2017, she released her first full-length covers album, Blossom. By November of the same year, she had released five additional EPs and her YouTube channel had surpassed 5 million subscribers.' +
            '\n\n80 tracks from more than 10 of her EPs were then re-released in April 2018 as Rose: The J.Fla Collection. Also during 2018, J.Fla released two all-new full-length albums, covering a diverse array of artists, including Taylor Swift, ABBA, The Chainsmokers, Ariana Grande, and Queen.' +
            '\n\nOn November 16th of 2018, J.Fla became the first independent Korean YouTuber to achieve more than 10 million subscribers. She now has more than 13 million subscribers. ',
          
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        );
      },
      itemCount: 1,
    );
  }
}
