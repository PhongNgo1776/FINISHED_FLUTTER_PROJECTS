import 'package:swmtp/screens/About.dart';
import 'package:swmtp/screens/Detail.dart';
import 'package:swmtp/screens/Home.dart';
import 'package:swmtp/screens/ListFilms.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: <String, WidgetBuilder>{
      '/': (context) => Home(),
      '/listfilms': (context) => ListFilms(),
      '/detail': (context) => Detail(),
      '/about': (context) => About(),
    },
  ));
}

class FilmInfo {
  final String title;
  final String content;
  final String videoKey;

  FilmInfo(this.title, this.content, this.videoKey);
}










