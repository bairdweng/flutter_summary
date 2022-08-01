import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InheritedParent extends InheritedWidget {
  const InheritedParent({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  //需要在子树中共享的数据，保存点击次数
  final int data;

  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget重新build
  @override
  bool updateShouldNotify(covariant InheritedParent oldWidget) {
    return oldWidget.data != data;
  }

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static InheritedParent? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedParent>();
  }
}

// 测试用的子树
class TestWidget extends StatefulWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  __TestWidgetState createState() => __TestWidgetState();
}

class __TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    String hello = InheritedParent.of(context)!.data.toString();
    //使用InheritedWidget中的共享数据
    return Text(hello);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    debugPrint("Dependencies change");
  }
}

class InheritedWidgetTestRoute extends StatefulWidget {
  const InheritedWidgetTestRoute({Key? key}) : super(key: key);

  @override
  _InheritedWidgetTestRouteState createState() =>
      _InheritedWidgetTestRouteState();
}

class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InheritedParent(
        //使用ShareDataWidget
        data: count,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: const TestWidget(), //子widget中依赖ShareDataWidget
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              // 点击时删除
              onPressed: () => {
                // debugPrint('hello add count');
                setState(() => {++count})
              },
            ),
          ],
        ),
      ),
    );
  }
}
