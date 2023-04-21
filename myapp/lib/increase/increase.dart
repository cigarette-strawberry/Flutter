// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors

import 'package:flutter/material.dart';

// 动态组件   StatefulWidget
class Increase extends StatefulWidget {
  // 传参，类的重写，我们使用这种方式传参是可以的。如果我们传递是数字字符串那么可以接受，但是如果是传递 组件/类 那么就不行了
  // Increase({required this.title})

  // 系统规定的写法
  // required 指必传
  const Increase({Key? key, required this.title}) : super(key: key);
  final String title;

  // 每一个动态组件里面都需要一个 createState 函数，意思就是生成状态
  @override
  // 类型写控制器名字，返回值是控制器这个类的实例
  _IncreaseState createState() {
    return _IncreaseState();
  }
}

// 每一个动态组件都需要一个控制器，用来对组件内部的状态进行控制，并且渲染被控制组件的UI结构
// 控制器有命名要求：_ + 被控制组件名字 + State
// State<> 这个尖括号里面要写成 被控制组件名字
class _IncreaseState extends State<Increase> {
  // 在变量当中下划线的用法要谨慎，当下划线在变量名前面的时候，代表这个组件或者这个函数/值 是私有的

  // 页面当中的数字需要增加，我们就定义一个状态值
  int _counter = 0;

  // 数字自增函数
  void _increaseCounter() {
    // 我们的 数字自增完成后，需要一个 setState 函数。如果不使用 setState 函数，那么我们的视图就不会刷新
    setState(() {
      _counter++;
    });
  }

  // 控制器内部的 build 函数，用来渲染被控制的组件的UI结构
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // flutter 中 widget 代表被控制的组件， widget.参数名   拿到参数
        title: Text('${widget.title}'),
      ),
      body: Center(
        // 从上到下排列组件的盒子
        child: Column(
          // 从上到下排列组件，这个是排列的方式
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('xiaowu'),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // 传入自增函数
        onPressed: _increaseCounter,
        // 提示信息
        tooltip: 'xiaoyu',
        // 图标
        child: Icon(Icons.add),
      ),
    );
  }
}

/* 静态函数的传参 */
class Abc extends StatelessWidget {
  // 接收参数，类的无参变为有参
  const Abc({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('$title'),
    );
  }
}
