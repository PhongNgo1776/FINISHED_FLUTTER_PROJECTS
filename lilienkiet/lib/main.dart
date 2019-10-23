import 'package:swthanhlongfilm/screens/About.dart';
import 'package:swthanhlongfilm/screens/Detail.dart';
import 'package:swthanhlongfilm/screens/Home.dart';
import 'package:swthanhlongfilm/screens/ListFilms.dart';
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










