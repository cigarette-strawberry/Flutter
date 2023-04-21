import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key, required this.id, required this.nm})
      : super(key: key);
  final int id;
  final String nm;

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final DetailList = {
    'nm': '小酷',
    'year': '2018',
    'src': '中国大陆',
    'cat': '动作',
    'language': '河南话',
    'comingTitle': '2018-11-11',
    'sc': '0.5',
    'howLong': '123分钟',
    'director': '小天',
    'star': 'A,B,C,D,E,F,G',
    'dra': '故事很牛逼',
    'img': ''
  };
  bool flag = false;

  @override
  void initState() {
    getDetail();
    super.initState();
  }

  void getDetail() async {
    try {
      Dio dio = Dio();
      Response response = await dio.get('path');

      // jsonDecode() 和 json.decode()   两种方法一致
      Map responseData = json.decode(response.toString());

      setState(() {
        // DetailList = responseData['detailMovie'];
        flag = true;
      });
    } catch (err) {
      print('$err');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 我们这里获取到的被控制组件的参数，需要使用 widget 来得到
        // widget 就代表上面的组件
        title: Text('${widget.nm}'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          // 顶部是一张大图
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 225,
                height: 315,
                decoration: BoxDecoration(color: Colors.purple),
                margin: EdgeInsets.only(top: 60, bottom: 30),
                child: Image(
                  width: 225,
                  height: 315,
                  fit: BoxFit.cover,
                  image: flag == false
                      ? NetworkImage(
                          'https://p0.meituan.net/128.180/movie/dd422b7d77d9cab1cace5e747f92e694701682.jpg')
                      : NetworkImage('${_imgReset('$DetailList["img"]')}'),
                ),
              )
            ],
          ),
          // 下面是电影文字内容信息
          _TextItem(title: '名称', text: '${DetailList['nm']}', axisFlag: false),
          _TextItem(
              title: '年代', text: '${DetailList['year']}', axisFlag: false),
          _TextItem(title: '产地', text: '${DetailList['src']}', axisFlag: false),
          _TextItem(title: '类别', text: '${DetailList['cat']}', axisFlag: false),
          _TextItem(
              title: '语言', text: '${DetailList['language']}', axisFlag: false),
          _TextItem(
              title: '上映日期',
              text: '${DetailList['comingTitle']}',
              axisFlag: false),
          _TextItem(
              title: '豆瓣评分', text: '${DetailList['sc']}', axisFlag: false),
          _TextItem(
              title: '片长', text: '${DetailList['howLong']}', axisFlag: false),
          _TextItem(
              title: '导演', text: '${DetailList['director']}', axisFlag: false),
          _TextItem(title: '主演', text: '${DetailList['star']}', axisFlag: true),
          _TextItem(title: '简介', text: '${DetailList['dra']}', axisFlag: true),
          Padding(padding: EdgeInsets.only(bottom: 30))
        ],
      ),
    );
  }

  String _imgReset(String img) => img.replaceAll('/w.h/', '/128.180/');
}

class _TextItem extends StatelessWidget {
  const _TextItem(
      {Key? key,
      required this.title,
      required this.text,
      required this.axisFlag})
      : super(key: key);
  final String title;
  final String text;
  final bool axisFlag;
  // 主演和简介的文字较多，要单独做处理，因此我们定义 axisFlag 这个布尔值，当他为true，我们对内容对其单独处理

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
      child: Row(
        crossAxisAlignment:
            axisFlag ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 85,
            child: title.length == 2
                ? Text('⚪ ${title[0]}        ${title[1]}')
                : Text('⚪ ${title}'),
          ),
          // 可以占据除了左边85之外的所有区域
          Expanded(
            child: Container(
              child: Text('${text}'),
            ),
          ),
        ],
      ),
    );
  }
}
