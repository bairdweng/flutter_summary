import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackLayoutExample extends StatefulWidget {
  const StackLayoutExample({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() => StackLayoutExampleState();
}

class StackLayoutExampleState extends State<StackLayoutExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: getStackExample(),
    );
  }

  //  层叠布局 Stack、Positioned
  Widget getStackExample() {
    //通过ConstrainedBox来确保Stack占满屏幕
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
        children: [
          Container(
            child: const Text("Hello world",
                style: TextStyle(color: Colors.white)),
            color: Colors.red,
          ),
          const Positioned(
            left: 18.0,
            top: 120,
            child: Text("I am Jack"),
          ),
          const Positioned(
            top: 18.0,
            child: Text("Your friend"),
          )
        ],
      ),
    );
  }

  // 红色box
  Widget redBox() {
    return const DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
    );
  }
}
