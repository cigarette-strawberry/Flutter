// ignore_for_file: use_key_in_widget_constructors, unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
// 引入 三个基本组件
import './SelfText.dart';
import './SelfContainer.dart';
import './SelfImage.dart';

// 计数器案列
import '../increase/increase.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app',
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: SelfText(),
      // home: SelfContainer(),
      // home: SelfImage(),

      // 计数器
      home: Increase(title: 'increase demo'),
    );
  }
}
