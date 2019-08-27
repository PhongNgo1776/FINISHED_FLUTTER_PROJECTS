import 'package:swkicm/screens/About.dart';
import 'package:swkicm/screens/Detail.dart';
import 'package:swkicm/screens/Home.dart';
import 'package:swkicm/screens/ListFilms.dart';
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








