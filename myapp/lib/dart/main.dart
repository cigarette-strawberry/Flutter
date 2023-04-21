// 引入 material 组件库，里面规定了很多组件，我们可以直接引用，还规定了移动端UI渲染的一些规范
import 'package:flutter/material.dart';

// 定义入口函数
void main() {
  // runApp 是系统函数，用来执行当前项目
  // MyApp 是一个组件，它的命名是系统规定好的，不过也可以修改，但是要一并修改
  runApp(MyApp());
}

// 简写形式，一行代码可以使用箭头函数写法
// void main() => runApp(MyApp());

// 无状态组件/静态组件   StatelessWidget
// 有状态组件/动态组件   StatefulWidget

// 所有的组件都是一个类，类型是 Widget
// MyApp 是一个静态组件，最外层的组件
// 在 MyApp 这个组件中，很多都是规定好的
class MyApp extends StatelessWidget {
  // override 意思是覆盖
  @override
  // build 是一个函数，是一个系统规定好的渲染函数
  // return 返回值是一个组件类型 Widget
  Widget build(BuildContext context) {
    return MaterialApp(
      // 类似于html当中的 title，不会显示在页面上，但是页面收起来的时候会看到
      title: 'app',
      // 规定当前组件的默认颜色
      theme: ThemeData(primarySwatch: Colors.blue),
      // 传递一个自定义规划组件
      home: MyHomePage(),
    );
  }
}

// 每一个组件都是一个类，组件名首字母大写
class MyHomePage extends StatelessWidget {
  // build 是一个系统规定的渲染函数，每一个静态组件中都需要传递一个build函数，不然无法进行UI渲染，Widget是返回值类型
  @override
  Widget build(BuildContext context) {
    // 脚手架工具，可以调用很多的组件
    return Scaffold(
      // 这个是给类进行传参
      // appBar 相当于参数名，AppBar() 相当于参数的值/实参
      // material 库提供的组件
      appBar: AppBar(
        title: Text('flutter demo'),
      ),
      // body 页面主体
      // Center 是一个居中的组件
      body: Center(
        child: Text('Hello Flutter'),
      ),
    );
  }
}


// 如果你用 flutter run 去执行当前项目，你需要按r/R去刷新页面，
// 所以调整UI样式的时候我们都用 菜单栏->调试->启动调试 来进行热加载
// 一般来说我们调试页面UI的时候用热重载，如果是调试 数据/状态 的时候，我们使用flutter run里面的命令行