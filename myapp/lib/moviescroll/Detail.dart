import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  Detail({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Detail'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image(
              image: NetworkImage('$url'),
            ),
            GestureDetector(
              onTap: () {
                // print('111');
                // 返回上一级页面
                Navigator.of(context).pop(123);
              },
              child: Text(
                '123',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
