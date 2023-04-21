// 引入组件库
import 'package:flutter/material.dart';

import './home/MyHomePage.dart';

// 定义入口函数
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 我们的项目都需要写在 MaterialApp 的里面
    return MaterialApp(
      title: 'app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // 传入我们自定义的 组件
      home: MyHomePage(),
    );
  }
}
