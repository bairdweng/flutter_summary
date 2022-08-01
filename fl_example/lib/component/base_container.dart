import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseContainerExample extends StatefulWidget {
  const BaseContainerExample({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() => BaseContainerExampleState();
}

class BaseContainerExampleState extends State<BaseContainerExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: initListView(),
    );
  }

  Widget initListView() {
    return Container(
        margin: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const Text('1. 装饰性容器DecoratedBox与填充Padding'),
            getExample1(),
            const Text('2. 变换容器TransFrom'),
            getTransForm(),
            const Text('3. 剪裁'),
            getClipView(),
            const Text('4. 空间适配 FittedBox'),
            getFittedBox(),
          ],
        ));
  }

  // 1. 装饰容器
  Widget getExample1() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.red, Colors.orange.shade700]), //背景渐变,
              borderRadius: BorderRadius.circular(3.0),
              boxShadow: const [
                //阴影
                BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0)
              ], //3像素圆角
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
              child: Text(
                "阴影圆角背景渐变等",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  // 2. 变换容器
  Widget getTransForm() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          //将Transform.rotate换成RotatedBox
          child: RotatedBox(
            quarterTurns: 1, //旋转90度(1/4圈)
            child: Text("Hello world"),
          ),
        ),
        Text(
          "你好",
          style: TextStyle(color: Colors.green, fontSize: 18.0),
        )
      ],
    );
  }

  // 3 .剪裁clip
  Widget getClipView() {
    Widget avatar = Image.asset("imgs/avatar.png", width: 60.0);
    return Column(
      children: [
        avatar, //不剪裁
        ClipOval(child: avatar), //剪裁为圆形
        ClipRRect(
          //剪裁为圆角矩形
          borderRadius: BorderRadius.circular(5.0),
          child: avatar,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              widthFactor: .5, //宽度设为原来宽度一半，另一半会溢出
              child: avatar,
            ),
            const Text(
              "你好世界",
              style: TextStyle(color: Colors.green),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRect(
              //将溢出部分剪裁
              child: Align(
                alignment: Alignment.topLeft,
                widthFactor: .5, //宽度设为原来宽度一半
                child: avatar,
              ),
            ),
            const Text("你好世界", style: TextStyle(color: Colors.green))
          ],
        ),
      ],
    );
  }

  // 4. 空间适配
  Widget getFittedBox() {
    return Column(
      children: [
        wContainer(BoxFit.none),
        const Text('Wendux'),
        wContainer(BoxFit.contain),
        const Text('Flutter中国'),
      ],
    );
  }

  Widget wContainer(BoxFit boxFit) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.red,
      child: FittedBox(
        fit: boxFit,
        // 子容器超过父容器大小
        child: Container(width: 60, height: 70, color: Colors.blue),
      ),
    );
  }
}
