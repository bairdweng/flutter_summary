import 'package:flutter/material.dart';

// 拷贝我看看 // 拷贝我看看  Flutter 替换成想要的就可以啦
class FlutterExample extends StatefulWidget {
  const FlutterExample({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() => FlutterExampleState();

}

class FlutterExampleState extends State<FlutterExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container());
  }
}



