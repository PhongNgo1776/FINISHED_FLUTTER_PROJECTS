import 'package:swjfla/screens/About.dart';
import 'package:swjfla/screens/Detail.dart';
import 'package:swjfla/screens/Home.dart';
import 'package:swjfla/screens/ListFilms.dart';
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










