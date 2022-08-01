import 'package:flutter/material.dart';
import './view/counter_page.dart';

// 拷贝我看看 // 拷贝我看看  Bloc 替换成想要的就可以啦
class BlocExample extends StatefulWidget {
  const BlocExample({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() => BlocExampleState();
}

class BlocExampleState extends State<BlocExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: const CounterPage());
  }
}
