import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swthanhlongfilm/models/Ads.dart';
import 'package:swthanhlongfilm/screens/DrawerMenu.dart';

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
    // Ads.hideBanner2Ad();
    // Ads.hideBanner3Ad();

    Ads.showBannerAd();
    // Timer.periodic(new Duration(seconds: 5), (timer) {
    //   Ads.showBannerAd();
    // });


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
        title: Text('Phim Hồng Kông Xưa Hay', style: TextStyle(color: Color.fromRGBO(210, 255, 77, 1)),),
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
                                      text: 'Thành Long: ', 
                                      style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),// default text style
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' (sinh ngày 7 tháng 4 năm 1954) là nam diễn viên phim hành động nổi tiếng người Hồng Kông. ', 
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
          height: 1200,
          padding: EdgeInsets.only(left: 10, right: 10),
          color: Colors.black,
          alignment: Alignment.topCenter,
          child: Text(
            '\Thành Long sinh năm 1954 tại Núi Thái Bình, Hồng Kông với tên khai sinh là Trần Cảng Sinh. Cha mẹ ông là những người di cư do cuộc Nội chiến Trung Quốc. Ông có biệt danh là Pháo Pháo (tiếng Trung Quốc: 炮炮) vì sở thích lăn lộn khi còn nhỏ của mình.[3]. Do cha mẹ ông làm việc cho Lãnh sự quán Pháp tại Hồng Kông, Thành Long đã trải qua thời ấu thơ tại khu vực của lãnh sự quán ở quận Núi Thái Bình[4]'
          + '\n\nThành Long đi học trường Tiểu học Nah-Hwa ở Đảo Hồng Kông, năm học đầu tiên ông bị ở lại lớp, rồi bỏ học do cha mẹ rút tên ông khỏi trường. Vào năm 1960, cha ông nhập cư vào Canberra, Úc để làm bếp trưởng cho đại sứ quán Hoa Kỳ, Thành Long được gửi tới học tại Học viện Hý kịch Trung Quốc, một ngôi trường do sư phụ Vu Chiêm Nguyên điều hành.[4][5]'
          + '\n\nThành Long đã phải trải qua quá trình huấn luyện khắt khe trong thời gian dài, đặc biệt là huấn luyện về võ thuật và nhào lộn[6]. Ông gia nhập nhóm Thất Tiểu Phúc, một nhóm gồm những học sinh xuất sắc nhất của trường được chọn để đi đóng phim, và lấy nghệ danh là Nguyên Lâu để tỏ lòng kính trọng sư phụ. Thành Long trở nên thân thiết với các thành viên trong nhóm như Hồng Kim Bảo và Nguyên Bưu.[7]'
          + '\n\nKhi được 8 tuổi, ông xuất hiện trong bộ phim Đại Tiểu Hoàng Thiên Bá (1962) cùng với một số bạn đồng môn trong nhóm "Thất Tiểu Phúc", trong phim Li Li Hua đóng vai bà mẹ của ông. Thành Long lại xuất hiện cùng với Li vào năm tiếp theo, trong bộ phim Lương Sơn Bá và Chúc Anh Đài (1963) rồi đóng một vai nhỏ trong bộ phim năm 1966 của Hồ Kim Thuyên có tên Đại túy hiệp. Vào năm 1971, sau khi xuất hiện trong một vai phụ của một bộ phim khác của Hồ Kim Thuyên, Hiệp Nữ, Thành Long bắt đầu sự nghiệp đóng phim với các vai diễn nhân vật trưởng thành trong ngành công nghiệp điện ảnh, bắt đầu bằng việc ký hợp đồng với Hãng phim Great Earth của Chu Mu.[8]. Lúc 17 tuổi, ông đóng vai phụ trong các cảnh võ thuật trong bộ phim Tinh võ môn và Long tranh hổ đấu của Lý Tiểu Long với nghệ danh Trần Nguyên Long[9]. Ông nhận được vai chính thức đầu tiên vào cuối năm đó, trong bộ phim Quảng Đông tiểu lão hổ, phát hành không nhiều tại Hồng Kông vào năm 1973.[10]'
          + '\n\nSau thất bại thương mại trong nỗ lực đầu tư ban đầu vào bộ phim và những rắc rối khi tìm vai đóng cảnh hành động, Thành Long đoàn tụ với cha mẹ tại Canberra năm 1976, nơi ông có thời gian ngắn học tại trường Cao đẳng Dickson và làm công nhân xây dựng[11]. Một người bạn cùng nghề xây dựng có tên Jack đã hướng dẫn cho Thành Long, vì vậy Thành Long được mọi người gọi là "Jack nhỏ" rồi sau đó viết ngắn lại thành "Jackie", từ đó tên Jackie Chan đã gắn liền với ông từ đó đến nay[12]. '
          + '\n\nNgoài ra, năm 2013 Thành Long đã đổi tên Trung Quốc của ông thành Phòng Sĩ Long, vì họ gốc của cha ông là họ Phòng.[12] Còn Trần trong tên khai sinh là Trần Cảng Sinh thực chất là họ của bà nội ông chứ không phải là họ mẹ ông. Cha ông là Phòng Đạo Long đã đổi sang họ Trần của mẹ (tức là bà nội của Thành Long) khi ông chuyển tới Hồng Kông. Con trai ông ban đầu đặt tên là Trần Tổ Danh, đến năm 2003 cũng được đổi thành Phòng Tổ Danh. \n\n Bên cạnh vai trò là một diễn viên, ông còn là đạo diễn, nhà sản xuất, chỉ đạo võ thuật, và chuyên đóng thế. Không chỉ nổi tiếng trong ngành điện ảnh thế giới, ông còn được biết đến như một doanh nhân thành đạt và là ca sĩ đã thu âm nhiều album. ',
          style: TextStyle(color: Colors.white),),

        );
      },
      itemCount: 1,
    );
  }
}
