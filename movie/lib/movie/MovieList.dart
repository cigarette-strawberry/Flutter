import 'dart:convert';

import 'package:flutter/material.dart';

// 引入dio插件，然后进行数据请求
import 'package:dio/dio.dart';

// 引入详情页
import '../detail/Detail.dart';

// 动态组件
class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  // 每一个动态组件当中都需要一个createState函数
  // 返回值是 _MovieListState() 执行后的结果
  @override
  _MovieListState createState() => _MovieListState();
}

// 控制器，我们的动态组件的状态在里面被管理，而且这个控制器可以渲染被控制组件的UI结构
class _MovieListState extends State<MovieList> {
  final List list = [
    {
      'id': 1,
      'name': '111',
      'sc': '1.2',
      'star': '小吴',
      'rt': '2021、12、23',
      'showinfo': '11:00',
      'img':
          'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp09%2F2105211120031355-0-lp.jpg'
    },
    {
      'id': 2,
      'name': '222',
      'sc': '1.2',
      'star': '小吴',
      'rt': '2021、12、23',
      'showinfo': '11:00',
      'img':
          'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp09%2F2105211120031355-0-lp.jpg'
    },
    {
      'id': 3,
      'name': '333',
      'sc': '1.2',
      'star': '小吴',
      'rt': '2021、12、23',
      'showinfo': '11:00',
      'img':
          'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp09%2F2105211120031355-0-lp.jpg'
    },
    {
      'id': 4,
      'name': '444',
      'sc': '1.2',
      'star': '小吴',
      'rt': '2021、12、23',
      'showinfo': '11:00',
      'img':
          'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp09%2F2105211120031355-0-lp.jpg'
    },
    {
      'id': 5,
      'name': '555',
      'sc': '1.2',
      'star': '小吴',
      'rt': '2021、12、23',
      'showinfo': '11:00',
      'img':
          'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp09%2F2105211120031355-0-lp.jpg'
    },
  ];

  // List list = [];

  @override
  // 状态初始化，系统提供的函数
  void initState() {
    getMovieList();
    super.initState();
  }

  // 请求数据
  getMovieList() async {
    try {
      // 生成一个 dio 实例
      Dio dio = Dio();
      // 调用 get 方法请求数据，要使用 async await 来异步获取数据
      Response response = await dio.get(
          'https://i.maoyan.com/ajax/moreComingList?token=&movieIds=1331230,1228771,1230121,1355028,1279727,1263434,1250708,338384,1363244,1355652&optimus_uuid=29F23DE062CA11EC97E5B17F51643A7138E805A2138945029456909734132910&optimus_risk_level=71&optimus_code=10');

      // 将字符串类型的数据解析成 Map 对象
      Map responseData = jsonDecode(response.toString());

      // 把请求回来的数据，赋值给变量 list ，需要调用 setState 方法，否则页面不会刷新
      setState(() {
        // list = responseData['coming'];
      });
    } catch (err) {
      print('$err');
    }
  }

  @override
  Widget build(BuildContext context) {
    // 对传递的数组 数据进行遍历
    return ListView.builder(
      // 遍历的数组长度
      itemCount: list.length,
      // 每次遍历执行的回调函数，返回值是一个Widget
      itemBuilder: (BuildContext context, int i) {
        Map _myitem = list[i];
        // 如果你想给一个组件添加事件，那么就把它包裹在 GestureDetector 的内部，
        // GestureDetector 提供了很多事件供你调用
        return GestureDetector(
          onTap: () {
            // 跳转到详情页
            // 这是系统为我们提供的路由跳转方法
            // MaterialPageRoute 是 Material UI库提供的路由组件
            Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) {
                return Detail(id: _myitem['id'], nm: _myitem['name']);
              }),
            );
          },
          child: Container(
            // all 是四个方向的边距
            // fromLTRB 四个方向分别写 左上右下
            // only left\right\top\bottom 自己传参
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                // 左边图片
                Container(
                  width: 150,
                  height: 180,
                  child: Image(
                    image: NetworkImage('${_imgReset(_myitem['img'])}'),
                  ),
                ),

                // 右边部分文字区域
                // Expanded 弹性盒子容器，可以占据多余空间
                Expanded(
                  child: Container(
                    height: 160,
                    color: Colors.red,
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      // 主轴副轴对齐，主轴均匀分布，副轴居左
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${_myitem['name']}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          '评分：${_myitem['sc']}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          '主演：${_myitem['star'] ?? '无'}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Text(
                          '上映日期：${_myitem['rt']}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          '排期：${_myitem['showinfo']}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _imgReset(String img) => img.replaceAll('/w.h/', '/128.180/');
}
