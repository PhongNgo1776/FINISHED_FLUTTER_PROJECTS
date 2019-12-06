import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:dio/dio.dart';
import 'package:swcttfilm/main.dart';

class ListFilms extends StatefulWidget {
  ListFilms({Key key}) : super(key: key);
  ListFilmsState createState() => ListFilmsState();
}

class ListFilmsState extends State<ListFilms> {
  bool isLoading = false;
  String title = 'Playlists';
  List items = new List();
  final dio = new Dio();
  String message = 'Loading...';
  String fbToken = '';

  Future<bool> _onWillPop() {
    Navigator.pop(context, true);
  }

  @override
  void initState() {
    super.initState();
    this._getData();
    this._getToken();

    Timer(Duration(seconds: 4), () {
      setState(() {
       message = "Vui lòng kết nối Wifi. Thanks 😘😘😘";
      });
    });

    Timer.periodic(new Duration(seconds: 4), (timer) {
      if(items.length == 0){
        _getData();
        _getToken();
      }
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

  void _getData() async {
    setState(() {
      isLoading = true;
    });

    final response = await dio.get('https://beer-199402.firebaseapp.com/api/v1/HkRetailFilms_v2');
    
    setState(() {
      isLoading = false;
      items = response.data[0]['filmList'];
      //Toast.show('ddddd: ' + items.length.toString(), context);
    });
  }

  void _getToken() async {
    final response = await dio.get('https://beer-199402.firebaseapp.com/api/v1/FbLongLiveToken');
    
    setState(() {
      fbToken = response.data['token'];
    });
  }

  void goToPath(dynamic item) async{
    String path = '';
    if(item['videoKey'].length == 11){
      path = '/ytDetail';
      Navigator.pushNamed(context, path, arguments: FilmInfo(item['title'], item['content'], item['videoKey'])); 
    } else {
      path = '/fbDetail';
      String url = "https://graph.facebook.com/v3.2/" + item['videoKey'] + "?fields=source&access_token=" + fbToken;
      final response = await dio.get(url);
      String videoUrl = response.data.substring(11, response.data.length - 26);
      Navigator.pushNamed(context, path, arguments: FilmInfo(item['title'], item['content'], videoUrl.replaceAll(new RegExp(r'\\'), ''))); 
    }
  }

  Image getImage(String key){
    if(key.length == 11){
      return Image.network("https://i.ytimg.com/vi/" + key + "/mqdefault.jpg", height: 90, width: 150);
    } else {
      return Image.asset("images/banner.png", height: 90, width: 150);
    }
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.black12, //or set color with: Color(0xFF0000FF)
    ));
    return new WillPopScope(
      onWillPop: _onWillPop,
      child:  Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
        iconTheme: new IconThemeData(color: Colors.yellow),
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
                    onTap: () { 
                     goToPath(items[index]);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 10, top: 3, bottom: 3),
                          alignment: Alignment.center,
                          // color: Colors.yellow,
                          decoration: myBoxDecoration(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              getImage(items[index]['videoKey']),
                              Expanded(
                                child:
                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Text(items[index]['title'], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow, fontSize: 20))
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
              },
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