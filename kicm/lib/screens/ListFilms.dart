import 'dart:async';
import 'dart:convert';

import 'package:swkicm/models/Ads.dart';
import 'package:swkicm/models/DetailAgrs.dart';
import 'package:swkicm/models/ListIndex.dart';
import 'package:swkicm/models/TypeVideo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

const THUMBNAIL_URL_ROOT = "https://i3.ytimg.com/vi/";
const THUMNAIL_SUFFIX = "/mqdefault.jpg";

Future<List<TypeVideo>> fetchData() async {
  final response = await http.get('https://beer-199402.firebaseapp.com/api/v1/kicm');
  
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    // return TypeVideo.fromJson(json.decode(response.body));

    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<TypeVideo>((json) => TypeVideo.fromJson(json)).toList();
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class ListFilms extends StatefulWidget {
  ListFilms({Key key}) : super(key: key);
  ListFilmsState createState() => ListFilmsState();
}

class ListFilmsState extends State<ListFilms> {
  String message = 'Đang Tải...';
  Future<bool> _onWillPop() {
    Navigator.pop(context, true);
  }

  @override
  void initState() {
    super.initState();
    Ads.showInterstitialAd();

    Timer(Duration(seconds: 3), () {
      setState(() {
       message = "Vui lòng kết nối internet. Thanks 😘😘😘";
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ListIndex args = ModalRoute.of(context).settings.arguments;
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
          new Center(
                child: 
                    FutureBuilder<List<TypeVideo>>(
                    future: fetchData(),
                    builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: <Widget>[
                          new Expanded(
                            child:  ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    padding: EdgeInsets.only(top: 60, left: 10, right: 10),
                                    itemCount: snapshot.data[args.listIndex].filmList.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () { Navigator.pushNamed(context, '/detail', arguments: DetailAgrs(snapshot.data[args.listIndex].filmList[index].title, snapshot.data[args.listIndex].filmList[index].videoKey)); },
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
                                                  Image.network(THUMBNAIL_URL_ROOT + snapshot.data[args.listIndex].filmList[index].videoKey + THUMNAIL_SUFFIX, height: 65, width: 120),
                                                  Expanded(
                                                    child:
                                                      Container(
                                                        margin: EdgeInsets.only(left: 5),
                                                        child: Text(snapshot.data[args.listIndex].filmList[index].title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow)),
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
                                  )
                                ),
                        ]);
                    } else  {
                      // By default, show a loading spinner.
                      return Center(child: Text(message, style: TextStyle(color: Colors.yellowAccent, fontWeight: FontWeight.bold),));
                    }
                  }
                )
          )
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