// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class SelfImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        // 我们在里面添加图片，一个是 网络图片，一个是 本地图片
        child: Container(
          width: 200,
          height: 100,
          child: Image(
            // 图片的伸展方式
            // fit: BoxFit.cover, // 图片完全伸展开，不拉伸，但是可能会裁切
            fit: BoxFit.fill, // 图片完全适应盒子容器，会拉伸
            // 一、引入网络图片
            /* image: NetworkImage(
                'https://upload.jianshu.io/users/upload_avatars/12442310/e11b2581-d89e-406e-95bc-5e1421066549.jpg'), */
            // 二、引入本地图片
            // 1、在项目根目录建立文件夹 images
            // 2、把我们需要引用的图片放在文件夹下
            // 3、在项目 pubspec.yaml 这个文件中进行一些配置，记得图片路径要修改，如下
            // assets:
            //     - images/1.png
            // 4、在代码中进行调用
            image: AssetImage('images/1.png'),
          ),
        ),
      ),
    );
  }
}
