import 'dart:async';
import 'dart:io';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swmtp/models/Ads.dart';
import 'package:swmtp/screens/DrawerMenu.dart';

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
    InterstitialAd(
      adUnitId: INTERSTITIAL_ID,
      targetingInfo: Ads.targetingInfo,
    )..load()..show();
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
            onPressed: () =>  {
              SystemNavigator.pop()
            },
            child: new Text('Có'),
          ),
        ],
      ),
    ) ?? false;
  }

  @override
  void initState() {
    super.initState();

    Ads.showBannerAd();


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
        title: Text('Sơn Tùng MTP - Video Nhạc', style: TextStyle(color: Color.fromRGBO(210, 255, 77, 1)),),
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
                                Image.asset("images/index.jpg", height: 150, width: 120),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text.rich(TextSpan(
                                      text: 'Nguyễn Thanh Tùng: ', 
                                      style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),// default text style
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' hay được biết đến với nghệ danh Sơn Tùng M-TP (sinh ngày 5 tháng 7 năm 1994) là một ca sĩ, nhạc sĩ và diễn viên người Việt Nam.', 
                                          style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white, fontWeight: FontWeight.normal)
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
                                child: Text('Xem Video Nhạc', style: TextStyle(color: Colors.red),),
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
                          Text("Giới thiệu ca sĩ: ", 
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
          height: 1200,
          padding: EdgeInsets.only(left: 10, right: 10),
          color: Colors.black,
          alignment: Alignment.topCenter,
          child: Column(children: <Widget>[
            Text(
            '\nCác đĩa đơn năm 2012 và 2013 của anh, "Cơn mưa ngang qua" và "Em của ngày hôm qua" đã đánh dấu mốc khởi đầu cho sự nghiệp của anh. Vào năm 2017, anh nhận được sự công nhận thiện chí hơn từ cộng đồng mạng sau khi phát hành hai đĩa đơn "Lạc trôi" và "Nơi này có anh". Sơn Tùng cũng cho ra mắt album tổng hợp m-tp M-TP vào cùng năm và cuốn tự truyện Chạm tới giấc mơ. Tháng 7 năm 2019, anh phát hành đĩa đơn "Hãy trao cho anh" gây tiếng vang lớn và lập được nhiều kỷ lục, được truyền thông quốc tế đánh giá cao. Cũng trong năm 2019, anh tổ chức tour diễn xuyên Việt Sky Tour 2019 tại 3 thành phố TP. HCM, Đà Nẵng và Hà Nội.' +
            '\n\nTùng đã có hơn bốn năm gắn bó với các hãng thu âm Văn Production và WePro Entertainment cho đến khi hãng thu âm của anh, M-TP Entertainment, được thành lập vào cuối năm 2016. Anh khởi động chuyến lưu diễn hòa nhạc đầu tiên, mang tên M-TP Ambition - Chuyến bay đầu tiên, vào năm 2015 và kết thúc vào năm 2016. Anh còn đóng vai chính trong bộ phim chiếu rạp năm 2014 Chàng trai năm ấy, và nhận được một Giải Cánh diều vàng cho hạng mục Diễn viên trẻ triển vọng cho phần diễn xuất của mình. Năm 2015, anh xuất hiện với vai trò là thí sinh trong chương trình âm nhạc Hòa âm Ánh sáng. Vào tháng 7 năm 2018, đạo diễn Nguyễn Quang Dũng cùng Bitis Hunter kết hợp làm ra một bộ phim ngắn “Chuyến đi của thanh xuân” và Sơn Tùng M-TP đảm nhận một vai khách mời trong bộ phim. Được mệnh danh là "Hoàng tử V-pop", Sơn Tùng M-TP đã nhận được nhiều giải thưởng bao gồm 1 giải thưởng Âm nhạc Cống hiến, 1 giải Âm nhạc châu Âu của MTV, 1 giải Mnet Asian Music Awards, 7 giải Làn Sóng Xanh và được đưa vào danh sách 30 Under 30 của tạp chí Forbes Vietnam.'
            , style: TextStyle(color: Colors.white)),
            Text("\n\nPhong cách: ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red,),),
            Text(
              "    \nDòng nhạc chủ đạo mà Sơn Tùng M-TP đang theo đuổi là EDM và Dance-pop. Các tác phẩm của anh luôn tạo ra được chất riêng với sự hòa hợp từ nhiều dòng nhạc khác nhau: một chút dance, một chút R&B, một chút rap, hip-hop và một chút âm hưởng dân ca Bắc Bộ. \n" +
              "    \nSơn Tùng có chất giọng nam cao rất sáng đẹp và truyền cảm, hơi giống giọng nữ. Dù không phải là chuyên gia về thanh nhạc, nhưng giọng hát mà anh sở hữu rất bắt tai giới trẻ lại vừa hợp với dòng nhạc chủ đạo của mình. Cùng với lợi thế ngoại hình kết hợp giọng hát, anh có sức hút trên thị trường âm nhạc và các show ca nhạc trên toàn quốc. \n" +
              "    \nPhong cách của Sơn Tùng nhiều lần bị nghi đạo G-Dragon (nhóm Big Bang). \n" +
              "    \nTheo Sơn Tùng, M-TP nghĩa là Music (Âm nhạc) - Tài năng - Phong cách.  \n" +
              " \n", style: TextStyle(color: Colors.white)),
          ],)
          );
      },
      itemCount: 1,
    );
  }
}
