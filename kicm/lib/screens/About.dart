import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swkicm/screens/DrawerMenu.dart';

class About extends StatelessWidget {
  final String title;
  final String message;

  // This Widget accepts the arguments as constructor parameters. It does not
  // extract the arguments from the ModalRoute.
  //
  // The arguments are extracted by the onGenerateRoute function provided to the
  // MaterialApp widget.
  const About({
    Key key,
    this.title,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.black12, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      appBar: AppBar(
        title: Text('Giới thiệu', style: TextStyle(color: Color.fromRGBO(210, 255, 77, 1)),),
        iconTheme: new IconThemeData(color: Color.fromRGBO(210, 255, 77, 1)),
        backgroundColor: Color.fromRGBO(50, 50, 50, 1),
        actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            )
        ]
      ),
      drawer: DrawerMenu(),
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(image: new AssetImage('images/bg.png'), fit: BoxFit.cover,),
            ),
          ),
          new Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Mục đích của ứng dụng:", style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold),),
                  Divider(),
                  Text("Tổng hợp những video hay của KICM", style: TextStyle(color: Colors.yellow), textAlign: TextAlign.left),
                  Text("Cập nhật những video nhạc mới nhất", style: TextStyle(color: Colors.yellow), textAlign: TextAlign.left),
                  Text("Hệ thống các video theo menu", style: TextStyle(color: Colors.yellow), textAlign: TextAlign.left)
              ],)
            )
          )
        ])
    );
  }
}