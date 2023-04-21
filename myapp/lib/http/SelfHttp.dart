import 'dart:convert';

import 'package:flutter/material.dart';
// 引入 dio 库
import 'package:dio/dio.dart';

class SelfHttp extends StatefulWidget {
  const SelfHttp({Key? key}) : super(key: key);

  @override
  _SelfHttpState createState() => _SelfHttpState();
}

class _SelfHttpState extends State<SelfHttp> {
  List _list = [
    {'nm': 'nm'}
  ];

  @override
  void initState() {
    // getMovieList();
    getMovieList2();
    super.initState();
  }

  void getMovieList() {
    try {
      Dio dio = Dio();
      dio
          .get(
              'https://i.maoyan.com/ajax/moreComingList?token=&movieIds=1363244,1355569,583154,1444433,1298520,1428367,1303049,1307078,1262741,1357983&optimus_uuid=29F23DE062CA11EC97E5B17F51643A7138E805A2138945029456909734132910&optimus_risk_level=71&optimus_code=10')
          .then((value) => print(value));
    } catch (err) {
      print('$err');
    }
  }

  void getMovieList2() async {
    try {
      Dio dio = Dio();
      Response response = await dio.get(
          'https://i.maoyan.com/ajax/moreComingList?token=&movieIds=1363244,1355569,583154,1444433,1298520,1428367,1303049,1307078,1262741,1357983&optimus_uuid=29F23DE062CA11EC97E5B17F51643A7138E805A2138945029456909734132910&optimus_risk_level=71&optimus_code=10');
      Map responseData = jsonDecode(response.toString());
      print(responseData);

      setState(() {
        _list = responseData['coming'];
      });
    } catch (err) {
      print('$err');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: _list.length,
          itemBuilder: (BuildContext context, int i) {
            Map _item = _list[i];
            return Text(
              '${_item['nm']}',
              style: TextStyle(fontSize: 30),
            );
          }),
    );
  }
}
