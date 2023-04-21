// ignore_for_file: prefer_const_constructors_in_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';

class MovieScroll extends StatelessWidget {
  MovieScroll({Key? key}) : super(key: key);

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
        child: ListView(
          // 横向排版需要添加一个属性
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            _ImgItem(url: imgList[0]),
            _ImgItem(url: imgList[1]),
            _ImgItem(url: imgList[2]),
            _ImgItem(url: imgList[3]),
            _ImgItem(url: imgList[4]),
          ],
        ),
      )),
    );
  }
}

class _ImgItem extends StatelessWidget {
  _ImgItem({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Image(
        image: NetworkImage('$url'),
        fit: BoxFit.cover,
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
