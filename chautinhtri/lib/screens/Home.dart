import 'dart:async';
import 'dart:io';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swcttfilm/models/Ads.dart';
import 'package:swcttfilm/screens/DrawerMenu.dart';

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
            onPressed: () =>  exit(0),
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
        title: Text('Phim Châu Tinh Trì', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
        iconTheme: new IconThemeData(color: Colors.yellowAccent),
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
                          height: 260, 
                          color: Colors.black,
                          padding: EdgeInsets.only(left: 10, right: 10, top: 50),
                          child: Column(
                            children: <Widget>[
                              Row(children: <Widget>[
                                Image.asset("images/index.jpg", height: 150, width: 90),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text.rich(TextSpan(
                                      text: 'Châu Tinh Trì: ', 
                                      style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),// default text style
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' (sinh ngày 22 tháng 6 năm 1962) là một nam diễn viên, đạo diễn, nhà biên kịch, nhà sản xuất nổi tiếng Hồng Kông. Ngoài ra anh còn là cố vấn chính trị của Hội nghị Hiệp thương Chính trị Nhân dân Trung Quốc.', 
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
                                child: Text('Xem Phim', style: TextStyle(color: Colors.red),),
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
            '\nKhi còn nhỏ, Châu rất thích Kung Fu nhưng phải học võ qua truyền hình vì cha mẹ anh không đủ tiền cho'
          + ' con theo học các lớp chính quy. Sau đó thì anh theo học Vịnh Xuân quyền và trở thành một người hâm mộ diễn viên Lý Tiểu Long. Cho đến tận ngày nay anh vẫn giữ niềm đam mê này và những bộ phim của Châu Tinh Trì thường có những cảnh gợi nhớ đến những tác phẩm Lý Tiểu Long tham gia diễn xuất. Cụ thể trong bộ phim Tuyệt đỉnh Kungfu của mình, Châu Tinh Trì đã mượn chiếc quần của Lý Tiểu Long từ người con gái của họ Lý. Nhiều động tác võ thuật và phong cách trình diễn được Châu Tinh Trì thể hiện lấy cảm hứng từ Lý Tiểu Long.'
          + 'Đổ thánh (All For The Winner), bộ phim đánh dấu bước ngoặt sự nghiệp của Châu Tinh Trì.'
          + '\n\nChâu Tinh Trì tốt nghiệp lớp diễn viên của hãng TVB (thuộc tập đoàn Thiệu Thị) năm 1982 và bắt đầu tham gia vào ngành công nghiệp giải trí với vai trò người dẫn chương trình cho tiết mục thiếu nhi 430 Shuttle của đài TVB. Trong hơn 5 năm, anh cũng tham gia vào một số phim truyền hình của TVB nhưng không có vai diễn nào nổi bật và Châu vẫn chỉ là một diễn viên ít được chú ý. Bước ngoặt trong sự nghiệp diễn xuất của Châu Tinh Trì đến khi anh tham gia bộ phim Final Justice - Phích lịch tiên phong (1988). Trong bộ phim này, Châu Tinh Trì đóng vai Boy, một tên trộm xe và thần tượng một thẩm phán biến chất vừa ra tù. Đây là lần đầu tiên Châu Tinh Trì tham gia đóng phim với nhiều đất diễn sau nhiều năm làm MC và đóng vai xác chết, nhưng anh đoạt luôn giải thưởng Kim Mã cho vai phụ xuất sắc nhất đồng thời được đề cử cho 2 giải "Diễn viên phụ xuất sắc nhất Hồng Kông" và "Gương mặt mới xuất sắc nhất Hồng Kông".'
          + '\n\nTừ năm 1994, Châu đã bắt đầu tự viết kịch bản và đạo diễn cho một số bộ phim. Bộ phim Đội bóng Thiếu Lâm đã phá vỡ kỷ lục doanh thu tại Hồng Kông năm 2001, kỷ lục này lại tiếp tục bị vượt qua bởi bộ phim tiếp theo của Châu là Tuyệt đỉnh Kungfu năm 2004.', 
          style: TextStyle(color: Colors.white),),

        );
      },
      itemCount: 1,
    );
  }
}
