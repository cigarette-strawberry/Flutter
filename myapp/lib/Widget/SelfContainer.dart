// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class SelfContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // 盒子容器
      body: Container(
        // 装饰器
        decoration: BoxDecoration(
            // 可以添加 背景色、背景图、边框。。。
            color: Colors.red),
        width: 100,
        height: 100,
        margin: EdgeInsets.all(30),
        padding: EdgeInsets.all(20),
      ),
      // Container 的 child 可以传递任何组件
      // 我们通常有一个习惯，写一个组件，需要进行一些自定义的修改的时候，但是呢，系统的组件不支持传值，我们就在外层套上一个 Container 盒子
    );
  }
}
