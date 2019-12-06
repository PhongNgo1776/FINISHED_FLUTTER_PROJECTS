import 'package:swcttfilm/screens/About.dart';
import 'package:swcttfilm/screens/FbDetail.dart';
import 'package:swcttfilm/screens/Home.dart';
import 'package:swcttfilm/screens/ListFilms.dart';
import 'package:flutter/material.dart';
import 'package:swcttfilm/screens/YtDetail.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: <String, WidgetBuilder>{
      '/': (context) => Home(),
      '/listFilms': (context) => ListFilms(),
      '/ytDetail': (context) => YtDetail(),
      '/fbDetail': (context) => FbDetail(),
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










