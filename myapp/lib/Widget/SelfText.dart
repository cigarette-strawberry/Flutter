// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class SelfText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /* return Container(
      child: Text('SelfText'),
    ); */
    return Scaffold(
      // Scaffold 是 material库为我们提供的组件
      appBar: AppBar(),
      // 一般来说，我们需要自定义一些组件 图片 文本之类的组件
      body: Center(
        child: Text(
          'hello flutter hello flutter hello flutter hello flutter hello flutter hello flutter hello flutter',
          style: TextStyle(
              fontSize: 30.0, //color: Colors.red
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.w700),
          // 溢出点点点
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
    );
  }
}
