// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

import '../moviescroll/Detail.dart';

class MovieScroll2 extends StatelessWidget {
  MovieScroll2({Key? key}) : super(key: key);

  final List imgList = [
    'https://t7.baidu.com/it/u=1819248061,230866778&fm=193&f=GIF',
    'https://t7.baidu.com/it/u=737555197,308540855&fm=193&f=GIF',
    'https://t7.baidu.com/it/u=1297102096,3476971300&fm=193&f=GIF',
    'https://t7.baidu.com/it/u=4240641596,3235181048&fm=193&f=GIF',
    'https://t7.baidu.com/it/u=4240641596,3235181048&fm=193&f=GIF',
  ];

  @override
  Widget build(BuildContext context) {
    // 一个排列的组件盒子，可以纵向排版，可以横向排版
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          // 这个是一个对数组进行遍历 然后再渲染的组件
          child: ListView.builder(
            // 横向排版需要添加一个属性
            scrollDirection: Axis.horizontal,
            // 传递一个回调函数，返回值是一个组件，一个是系统提供的上下文 context ，一个是 index(索引) ，我们每次遍历到当前项的索引值
            itemBuilder: (BuildContext context, int index) {
              var _item = imgList[index];
              return _ImgItem(url: _item);
            },
            // 遍历的次数
            itemCount: imgList.length,
          ),
        ),
      ),
    );
  }
}

class _ImgItem extends StatelessWidget {
  _ImgItem({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    // 如果我们需要在我们的组件上添加事件，那么我们就调用一个组件
    // 我们可以把事件添加到 GestureDetector 上
    return GestureDetector(
      onTap: () {
        // print('$url');
        // 跳转路由，跳转到我们的详情页
        // Navigator.of(context).push() 是我们路由跳转的方法
        // MaterialPageRoute 相当于路由组件，是 material 库为我们提供的
        // builder 传递一个函数 返回值是我们需要跳转到的组件
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return Detail(url: url);
        })).then((value) => {print(value)});
      },
      child: Container(
        width: 300,
        child: Image(
          image: NetworkImage('$url'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

/* 
  ListView   和   ListView.builder
  它会不停的进行排版，不会有溢出，可以用滚动条来滑动

  和 Column 和 Row 排版上的简单区别
  会溢出，类似于一个盒子，横着放或者竖着放，放多了溢出
 */
