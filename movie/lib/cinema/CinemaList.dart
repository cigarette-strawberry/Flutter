import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

// 动态组件
class CinemaList extends StatefulWidget {
  const CinemaList({Key? key}) : super(key: key);

  @override
  _CinemaListState createState() => _CinemaListState();
}

// 控制器
class _CinemaListState extends State<CinemaList> {
  List cinemas = [
    {
      "id": 27292,
      "mark": 0,
      "nm": "东方嘉禾影城（奥斯卡花丹店）",
      "sellPrice": "19.9",
      "addr": "金水区花园路农业路交叉口丹尼斯百货14层",
      "tag": {
        "allowRefund": 1,
        "buyout": 0,
        "cityCardTag": 0,
        "deal": 0,
        "endorse": 1,
        "giftTag": "",
        "hallType": [],
        "hallTypeVOList": [],
        "sell": 1,
        "snack": 1,
        "vipTag": "折扣卡"
      },
      "promotion": {
        "cardPromotionTag": "开卡特惠，10.9元起开卡",
        "couponPromotionTag": "",
        "merchantActivityTag": "",
        "packShowActivityTag": "",
        "platformActivityTag": "",
        "starActivityTag": ""
      },
      "showTimes": ""
    },
  ];

  // 定义当前页面使用的数据
  // List cinemas = [];

  // 存储当前页面需要的三种颜色
  // 红色
  Color color0 = Color.fromARGB(255, 240, 61, 55);
  // 橙色
  Color color1 = Color.fromARGB(255, 255, 153, 0);
  // 黄绿色
  Color color2 = Color.fromARGB(255, 88, 157, 175);

  // 我们需要一个函数 对 tag 进行处理，然后根据实际进行渲染
  List<Widget> tagWidgets(tag) {
    // tag标签的数组
    List<Widget> tagList = [];

    // 退
    if (tag['allowRefund'] == 1) {
      tagList.add(CinemaTag(
        color: color2,
        text: '退',
      ));
    }

    // 改签
    if (tag['endorse'] == 1) {
      tagList.add(CinemaTag(
        color: color2,
        text: '改签',
      ));
    }

    // 小吃
    if (tag['snack'] == 1) {
      tagList.add(CinemaTag(
        color: color1,
        text: '小吃',
      ));
    }

    // 折扣卡
    if (tag['vipTag'] is String && tag['vipTag'].length > 0) {
      tagList.add(CinemaTag(
        color: color1,
        text: '${tag['vipTag']}',
      ));
    }

    // 影厅部分
    if (tag['hallType'] is List) {
      tag['hallType'].forEach((str) {
        tagList.add(CinemaTag(
          color: color2,
          text: str,
        ));
      });
    }

    return tagList;
  }

  @override
  void initState() {
    getCinemaList();
    super.initState();
  }

  // 获取数据
  void getCinemaList() async {
    try {
      Dio dio = Dio();
      Response response = await dio.get(
          'https://i.maoyan.com/ajax/moreCinemas?movieId=0&day=2021-12-23&offset=20&limit=20&districtId=-1&lineId=-1&hallType=-1&brandId=-1&serviceId=-1&areaId=-1&stationId=-1&item=&updateShowDay=true&reqId=1640245239510&cityId=73&optimus_uuid=29F23DE062CA11EC97E5B17F51643A7138E805A2138945029456909734132910&optimus_risk_level=71&optimus_code=10');

      print(response);

      Map responseData = jsonDecode(response.toString());

      setState(() {
        // cinemas = responseData['cinemas'];
      });
    } catch (err) {
      print('$err');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        // 遍历的次数
        itemCount: cinemas.length,
        // 每次遍历都要执行后面的回调函数
        itemBuilder: (BuildContext context, int i) {
          Map _cinemas = cinemas[i];
          return Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                // 第一行 名称和价格
                Padding(
                  padding: EdgeInsets.only(bottom: 3),
                  child: Row(
                    // 三行文字底部对齐
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        '${_cinemas['nm']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '${_cinemas['sellPrice']}',
                        style: TextStyle(
                          color: color0,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '元',
                        style: TextStyle(
                          color: color0,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),

                // 的二行 地址和距离
                Padding(
                  padding: EdgeInsets.only(bottom: 3),
                  child: Row(
                    children: <Widget>[
                      // 弹性盒子，可以占据多余的空间
                      Expanded(
                        child: Text(
                          '${_cinemas['addr']}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: Color.fromARGB(255, 102, 102, 102),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // 第三行 tag标签
                Padding(
                  padding: EdgeInsets.only(bottom: 3),
                  child: Row(
                    /* children: <Widget>[
                    CinemaTag(
                      text: '小吃',
                      color: color1,
                    ),
                    CinemaTag(
                      text: '折扣卡',
                      color: color1,
                    ),
                    CinemaTag(
                      text: '杜比全景声厅',
                      color: color2,
                    ),
                  ], */
                    children: tagWidgets(_cinemas['tag']),
                  ),
                ),

                // 第四行 一个 icon 和优惠信息
                _cinemas['promotion']['cardPromotionTag'] is String
                    ? Row(
                        children: <Widget>[
                          // 图标
                          Container(
                            width: 17,
                            height: 17,
                            margin: EdgeInsets.only(right: 5),
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage('images/card.png'),
                            ),
                          ),
                          // 优惠信息
                          Text(
                            '${_cinemas['promotion']['cardPromotionTag']}',
                            style: TextStyle(
                                color: Color.fromARGB(255, 153, 153, 153),
                                fontSize: 13),
                          )
                        ],
                      )
                    : Container(),
              ],
            ),
          );
        },
      ),
    );
  }
}

// 第三行的标签
class CinemaTag extends StatelessWidget {
  CinemaTag({Key? key, required this.text, required this.color})
      : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        // 边框
        border: Border.all(
          color: color,
        ),
        // 圆角
        borderRadius: BorderRadius.all(
          Radius.circular(3),
        ),
      ),
      padding: EdgeInsets.fromLTRB(2, 0, 2, 1),
      child: Text(
        '$text',
        style: TextStyle(color: color, fontSize: 11),
      ),
    );
  }
}
