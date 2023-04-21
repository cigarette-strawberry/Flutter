// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

// 引入三个组件
import './TitleSection.dart';
import './IconSection.dart';
import './TextSection.dart';

class Lakes extends StatelessWidget {
  const Lakes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          // 第一部分
          Image(image: AssetImage('images/lakes.png')),
          // 第二部分
          TitleSection(),
          // 第三部分
          IconSection(),
          // 第四部分
          TextSection()
        ],
      ),
    );
  }
}

// Column 纵向排版
// Row 横向排版
// 给他们两个传递参数，都会有一个属性 children ,后面跟了一个数组，里面的每一项都是一个 Widget 组件