import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:letmetellyou/chewie_list_item.dart';
import 'package:letmetellyou/ads.dart';

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

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network('https://phongngo1776.github.io/Videos/DeMiNoiChoMaNghe/DeMiNoiChoMaNghe.mp4')
    ..addListener(() {
        final bool isPlaying = _videoPlayerController.value.isPlaying;
        if(isPlaying){
          Ads.showInterstitialAd();
          // new Timer(const Duration(milliseconds: 500000), () {
          //   setState(() {
          //     myInterstitial.dispose();
          //   });
          // });
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
        title: Text('Để Mị Nói Cho Mà Nghe - Hoàng Thùy Linh', style: TextStyle(color: Colors.yellowAccent)),
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
          height: 1300,
          margin: EdgeInsets.only(bottom: 3, left: 10),
          alignment: Alignment.topCenter,
          child: Text(
            "\nĐể Mị nói cho mà nghe \n" +
            "Tâm hồn này chẳng để lặng lẽ \n" +
            "Thương cha xót mẹ \n" +
            " \n" +
            "Thôi thì mặc phận đời mình chơi vơi \n" +
            "Để Mị nói cho mà nghe \n" +
            "Tết năm nay Mị vẫn còn trẻ \n" +
            "Xuân đương tới rồi \n" +
            "Nên Mị cũng muốn đi chơi \n" +
            " \n" +
            "Này là mình đi theo giấc mơ sớm mai gọi mời \n" +
            "Nơi vòng tay ấm êm chẳng rời \n" +
            "Hoa ban trắng nở đầy con bản nọ \n" +
            "Hương sắc còn chưa phai \n" +
            "Đời mình đâu có mấy vui cớ sao lại buồn \n" +
            "Biết ngày mai trắng đen hay tròn vuông \n" +
            "Em không bắt quả pao rơi rồi \n" +
            "Tiếc không một đời đơn côi \n" +
            " \n" +
            "Để Mị nói cho mà nghe \n" +
            "(Để Mị...) \n" +
            "Để Mị nói cho mà nghe \n" +
            "(Mị...) \n" +
            "Để Mị nói... \n" +
            "Mị vẫn còn trẻ \n" +
            "(Nói...) \n" +
            " \n" +
            "Mị còn trẻ Mị còn muốn đi chơi \n" +
            "Thanh xuân sao lại phải nghỉ ngơi \n" +
            "Hoa ban trắng trên nương chớm nở đẹp như tâm hồn em còn ngây thơ \n" +
            "Em làm gì đã có người yêu \n" +
            "Em còn đang sợ ế đây này \n" +
            "Vậy tại sao quả pao không năm trên tay để bao trai làng chìm đắm trong mê say \n" +
            "Mùa xuân này, Mị muốn xúng xính trong váy hoa \n" +
            "Không đi làm sao biết ngoài kia một mai là sương hay nắng toả \n" +
            "Cơ hội này Mị sẽ nắm lấy \n" +
            "Mị chẳng cần một ai dắt tay, và hết hôm nay \n" +
            "Mị sẽ chuồn khỏi nơi đây! \n" +
            " \n" +
            "Để Mị nói cho mà nghe \n" +
            "Tâm hồn này chẳng để lặng lẽ \n" +
            "Thương cha xót mẹ \n" +
            "Thôi thì mặc phận đời mình chơi vơi \n" +
            "Để Mị nói cho mà nghe \n" +
            "Tết năm nay Mị vẫn còn trẻ \n" +
            "Xuân đương tới rồi \n" +
            "Nên Mị cũng muốn đi chơi... \n" +
            " \n" +
            "Này là mình đi theo giấc mơ sớm mai gọi mời \n" +
            "Nơi vòng tay ấm êm chẳng rời \n" +
            "Hoa ban trắng nở đầy con bản nọ \n" +
            "Hương sắc còn chưa phai \n" +
            "Đời mình đâu có mấy vui cớ sao lại buồn \n" +
            "Biết ngày mai trắng đen hay tròn vuông \n" +
            "Em không bắt quả pao rơi rồi \n" +
            "Tiếc không một đời đơn côi \n" +
            " \n" +
            "Để Mị nói cho mà nghe \n" +
            "(Để Mị...) \n" +
            "Để Mị nói cho mà nghe \n" +
            "(Mị...) \n" +
            "Để Mị nói... \n" +
            "Mị vẫn còn trẻ \n" +
            "(Nói...) \n" +
            "Để Mị nói \n"

          ),

        );
      },
      itemCount: 1,
    );
  }
}
