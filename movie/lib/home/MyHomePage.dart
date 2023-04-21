import 'package:flutter/material.dart';

// 引入页面
import '../movie/MovieList.dart';
import '../cinema/CinemaList.dart';
import '../detail/Detail.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 控制器，导航和页面的联动效果需要一个控制器去控制，这个组件直接帮助我们添加好了
    return DefaultTabController(
        // 控制器 控制页面切换的数量，页面和导航的数量要一致
        length: 3,
        // 脚手架工具
        child: Scaffold(
          // 顶部导航
          appBar: AppBar(
            title: Text('小吴影院'),
            centerTitle: true,
            actions: <Widget>[
              IconButton(onPressed: () {}, icon: Icon(Icons.search))
            ],
          ),
          // 侧边栏
          drawer: Drawer(
            // ListView 是从上到下排列的盒子容器，当然也能从左到右排列
            child: ListView(
              // 去掉顶部的 padding 间距
              padding: EdgeInsets.all(0),
              // 尖括号里面 代表对数组内部每一项规定数据类型
              children: <Widget>[
                // 侧边栏头部
                UserAccountsDrawerHeader(
                  accountName: Text('小吴'),
                  accountEmail: Text('123@qq.com'),
                  // 头像区域
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp02%2F1Z9191GF921C-0-lp.jpg'),
                  ),
                  // 装饰器
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      // 图片填充，cover 代表自适应填充，但是会被裁切
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp09%2F2105211120031355-0-lp.jpg'),
                    ),
                  ),
                ),

                ListTile(
                  title: Text('我的发布'),
                  trailing: Icon(Icons.send),
                ),
                ListTile(
                  title: Text('我的收藏'),
                  trailing: Icon(Icons.feedback),
                ),
                ListTile(
                  title: Text('系统设置'),
                  trailing: Icon(Icons.settings),
                ),
                // Color.fromARGB(a, r, g, b) 自定义颜色 a 代表透明度 255
                Divider(
                  color: Colors.black,
                ),
                ListTile(
                  title: Text('注销'),
                  trailing: Icon(Icons.exit_to_app),
                ),
              ],
            ),
          ),
          // 页面需要传递 TabBarView ，来实现联动效果
          body: TabBarView(
            children: <Widget>[
              Text('page1', style: TextStyle(fontSize: 30)),
              // Detail(),
              // Text('page2', style: TextStyle(fontSize: 30)),
              MovieList(),
              // Text('page3', style: TextStyle(fontSize: 30)),
              CinemaList(),
            ],
          ),
          // 底部导航
          bottomNavigationBar: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            // TabBar 是系统提供的底部导航组件，可以实现与页面的联动效果
            child: TabBar(
              labelStyle: TextStyle(
                // height 指字符的高度
                height: 0,
                fontSize: 11,
              ),
              tabs: <Widget>[
                Tab(text: '首页', icon: Icon(Icons.home)),
                Tab(text: '正在热映', icon: Icon(Icons.movie_creation)),
                Tab(text: '影院信息', icon: Icon(Icons.local_movies))
              ],
            ),
          ),
        ));
  }
}
