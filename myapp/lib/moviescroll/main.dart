// ignore_for_file: use_key_in_widget_constructors, unused_import, prefer_const_constructors

import 'package:flutter/material.dart';

// 电影海报无缝滚动
import '../moviescroll/MovieScroll.dart';
import '../moviescroll/MovieScroll2.dart';
import '../moviescroll/Detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app',
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: MovieScroll(),
      home: MovieScroll2(),
      // home: Detail(),
    );
  }
}
