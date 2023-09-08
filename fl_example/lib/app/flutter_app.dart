//@dart=2.17
import 'package:flutter/material.dart';

// 拷贝我看看 // 拷贝我看看  Flutter 替换成想要的就可以啦
typedef CallBack = void Function(String val);

class FlutterApp extends StatefulWidget {
  const FlutterApp({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() => FlutterAppState();
}

class FlutterAppState extends State<FlutterApp> {
  void onChange(String val) {
    debugPrint('收到值发生改变');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          color: Colors.yellow,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: const FlutterAppHeader(),
              ),
              Container(
                  margin: const EdgeInsets.all(10),
                  child: FlutterAppContent(helloCall: (val) => onChange(val)))
            ],
          ),
        ));
  }
}

// 看看这两个怎么交流吧
class FlutterAppHeader extends StatefulWidget {
  const FlutterAppHeader({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FlutterAppHeaderState();
  }
}

class FlutterAppHeaderState extends State<FlutterAppHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.green,
      child: ElevatedButton(
        child: const Text("组件1"),
        onPressed: () {
          debugPrint("我是组件1");
        },
      ),
    );
  }
}

class FlutterAppContent extends StatefulWidget {
  final CallBack? helloCall;
  const FlutterAppContent({Key? key, this.helloCall}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return FlutterAppContentState();
  }
}

class FlutterAppContentState extends State<FlutterAppContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.green,
      child: ElevatedButton(
        child: const Text("组件2"),
        onPressed: () {
          debugPrint("我是组件2");
          widget.helloCall!('123123123');
        },
      ),
    );
  }
}
