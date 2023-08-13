import 'package:flutter/material.dart';

class WidgetsExample extends StatefulWidget {
  const WidgetsExample({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() => WidgetsExampleState();
}

class WidgetsExampleState extends State<WidgetsExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: getListView(),
    );
  }

  Widget getListView() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ListView(
        children: [
          const Text('1.看看父子约束相关'),
          getConstrainedBox(),
          const Text('2.来一个固定大小的盒子'),
          Row(
            children: [getSizeBox()],
          ),
          const Text('3.看看父子约束相关，多重限制'),
          Row(
            children: [getMutableAstrict()],
          ),
          const Text('4.去除父级限制'),
          Row(
            children: [getUnconstrainedWidget()],
          ),
          const Text('5.线性布局'),
          getRowExample(),
          const Text('6.弹性布局'),
          getFlexExample(),
          const Text('7.流式布局 Wrap & Flow'),
          getWarpExample(),
          const Text('8.层叠布局 Stack、Positioned3'),
        ],
      ),
    );
  }

  // 1. 普通容器盒子
  Widget getConstrainedBox() {
    Widget redBox = ConstrainedBox(
      constraints: const BoxConstraints(
          minWidth: double.infinity, //宽度尽可能大
          minHeight: 50.0 //最小高度为50像素
          ),
      child: Container(
          margin: const EdgeInsets.all(0),
          child: const DecoratedBox(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              "基本的布局 ConstrainedBox  设置最小高度50",
              strutStyle: StrutStyle(height: 1),
            ),
          )),
    );
    return redBox;
  }

  // 2. 获取一个固定大小
  Widget getSizeBox() {
    return SizedBox(width: 60, height: 60, child: redBox());
  }

  // 3. 多重限制 父子间取最大
  Widget getMutableAstrict() {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 40.0, minHeight: 60.0), //父
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 20.0, minHeight: 20.0), //子
        child: redBox(),
      ),
    );
  }

  // 4. 去除父级限制
  Widget getUnconstrainedWidget() {
    return ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 60.0, minHeight: 100.0), //父
        child: UnconstrainedBox(
          //“去除”父级限制
          child: ConstrainedBox(
            constraints:
                const BoxConstraints(minWidth: 90.0, minHeight: 20.0), //子
            child: redBox(),
          ),
        ));
  }

  // 5. row&clumn
  Widget getRowExample() {
    return Column(
      //测试Row对齐方式，排除Column默认居中对齐的干扰
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(" hello world "),
            Text(" I am Jack "),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(" hello world "),
            Text(" I am Jack "),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          textDirection: TextDirection.rtl,
          children: const [
            Text(" hello world "),
            Text(" I am Jack "),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.up,
          children: const [
            Text(
              " hello world ",
              style: TextStyle(fontSize: 30.0),
            ),
            Expanded(child: Text("Expanded 我会铺满的哦 我会铺满的哦 我会铺满的哦 我会铺满的哦"))
          ],
        ),
      ],
    );
  }

  // 6. 弹性布局
  Widget getFlexExample() {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 30.0,
            color: Colors.red,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 30.0,
            color: Colors.green,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 30.0,
            color: Colors.yellow,
          ),
        ),
      ],
    );
  }

  // 7. 流失布局
  Widget getWarpExample() {
    return Wrap(
      spacing: 8.0, // 主轴(水平)方向间距
      runSpacing: 4.0, // 纵轴（垂直）方向间距
      alignment: WrapAlignment.start, //沿主轴方向居中
      children: const [
        Chip(
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
          label: Text('Hamilton'),
        ),
        Chip(
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
          label: Text('Lafayette'),
        ),
        Chip(
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
          label: Text('Mulligan'),
        ),
        Chip(
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
          label: Text('Laurens'),
        ),
      ],
    );
  }

  // 红色box
  Widget redBox() {
    return const DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
    );
  }
}
