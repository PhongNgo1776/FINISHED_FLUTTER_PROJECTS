import 'dart:async';

import 'package:dio/dio.dart';
import 'package:swkicm/models/Ads.dart';
import 'package:swkicm/models/DetailAgrs.dart';
import 'package:swkicm/models/ListIndex.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

const THUMBNAIL_URL_ROOT = "https://i3.ytimg.com/vi/";
const THUMNAIL_SUFFIX = "/mqdefault.jpg";

class ListFilms extends StatefulWidget {
  ListFilms({Key key}) : super(key: key);
  ListFilmsState createState() => ListFilmsState();
}

class ListFilmsState extends State<ListFilms> {
  String message = 'Đang Tải...';
  List listDataRepsonse = new List();
  List items = new List();
  bool isLoading = false;
  final dio = new Dio();
  ListIndex args;

  Future<bool> _onWillPop() {
    Navigator.pop(context, true);
  }

  @override
  void initState() {
    super.initState();
    _getData(); 

    Ads.showInterstitialAd();

    Timer(Duration(seconds: 3), () {
      setState(() {
       message = "Vui lòng kết nối internet. Thanks 😘😘😘";
      });
    });

    Timer.periodic(new Duration(seconds: 2), (timer) {
      if(items.length == 0){
        _getData();
      }
    });
  }

  void _getData() async {
    setState(() {
      isLoading = true;
    });

    final response = await dio.get('https://beer-199402.firebaseapp.com/api/v1/kicm');
    
    setState(() {
      isLoading = false;
      listDataRepsonse = response.data;
      items = listDataRepsonse[args.listIndex]['filmList'];
      //Toast.show('ddddd: ' + items.length.toString(), context);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: Text(message, style: TextStyle(color: Colors.yellowAccent, fontWeight: FontWeight.bold),)
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context).settings.arguments;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.black12, //or set color with: Color(0xFF0000FF)
    ));
    return new WillPopScope(
      onWillPop: _onWillPop,
      child:  Scaffold(
      appBar: AppBar(
        title: Text(args.listIndex == 0 ? 'MV KICM - JACK' : 'LIVE KICM - JACK', style: TextStyle(color: Color.fromRGBO(210, 255, 77, 1)),),
        iconTheme: new IconThemeData(color: Color.fromRGBO(210, 255, 77, 1)),
        backgroundColor: Color.fromRGBO(50, 50, 50, 1),
      ),
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(image: new AssetImage('images/bg.png'), fit: BoxFit.cover,),
            ),
          ),
          new Container(
            padding: EdgeInsets.only(top: 60),
            child: new ListView.builder(
              //+1 for progressbar
              itemCount: items.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == items.length) {
                  return _buildProgressIndicator();
                } else {
                  return GestureDetector(
                    onTap: () { Navigator.pushNamed(context, '/detail', arguments: DetailAgrs(items[index]['title'], items[index]['videoKey'])); },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          alignment: Alignment.center,
                          // color: Colors.yellow,
                          decoration: myBoxDecoration(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.network(THUMBNAIL_URL_ROOT + items[index]['videoKey'] + THUMNAIL_SUFFIX, height: 65, width: 120),
                              Expanded(
                                child:
                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Text(items[index]['title'], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow)),
                                  )
                              )
                            ],
                          )
                        ),
                        Divider(height: 10), //  
                      ]
                    )
                  );
                }
              }
          ))
        ]
      )
    ));
  }
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    color: Color.fromRGBO(50, 50, 50, 1),
    border: Border.all(
      width: 3.0
    ),
    borderRadius: BorderRadius.all(
        Radius.circular(5.0) //         <--- border radius here
    ),
  );
}