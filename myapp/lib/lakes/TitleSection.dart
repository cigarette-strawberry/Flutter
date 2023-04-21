// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        children: <Widget>[
          // 左部分
          // 弹性布局组件
          Expanded(
            child: Column(
              // 主轴 从上到下
              // 副轴 左右
              // 在 副轴 上调整位置，居左对齐
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
          // 中 星星图标
          Icon(
            Icons.star,
            color: Colors.red,
          ),
          // 右 数字
          Text('41')
        ],
      ),
    );
  }
}
