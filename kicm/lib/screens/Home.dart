import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swkicm/models/Ads.dart';
import 'package:swkicm/screens/DrawerMenu.dart';

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
        title: new Text('Bạn có muốn thoát ứng dụng?'),
        content: new Text('Bạn chắc chứ?'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('Không'),
          ),
          new FlatButton(
            onPressed: () =>  SystemNavigator.pop(),
            child: new Text('Có'),
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
        title: Text('K-ICM - Album Mới Nhất', style: TextStyle(color: Color.fromRGBO(210, 255, 77, 1)),),
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
                          height: 200, 
                          color: Colors.black,
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            children: <Widget>[
                              Row(children: <Widget>[
                                Image.asset("images/index.jpg", height: 150, width: 90),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text.rich(TextSpan(
                                      text: 'K-ICM: ', 
                                      style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),// default text style
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' (12/07/1999) Chàng trai gây bão mạng với những livstream chơi nhạc phá kỷ lục lên tới 26k lượt xem. ', 
                                          style: TextStyle(fontStyle: FontStyle.italic, color: Colors.yellow, fontWeight: FontWeight.normal)
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
                                child: Text('Xem Nhạc', style: TextStyle(color: Colors.red),),
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
                          Text("Tiểu Sử: ", 
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
          color: Colors.black,
          alignment: Alignment.topCenter,
          child: Text(
            '\nK-ICM đã trở thành hiện tượng mạng khi biến đàn organ thành DJ, đàn tranh, đàn bầu và rất nhiều các loại nhạc cụ khác. Từ cậu bé với ước mơ nâng tầm cây đàn organ của mình, Khánh đã dần trở thành người biểu diễn tài năng trên những sân khấu lớn với hàng ngàn người tham dự. Đồng thời với vai trò là nhà sản xuất âm nhạc, Khánh cũng đã ra đời những bản hòa âm phối khí gây hot. K-ICM hiện làm việc cho công ty Incuommos. Album đã phát hành: Buồn Của Anh (Single) (2017)',
          style: TextStyle(color: Colors.white),),

        );
      },
      itemCount: 1,
    );
  }
}
