import 'package:flutter/material.dart';

// 拷贝我看看 // 拷贝我看看  XXXXXX 替换成想要的就可以啦
class XXXXXXExample extends StatefulWidget {
  const XXXXXXExample({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() => XXXXXXExampleState();
}

class XXXXXXExampleState extends State<XXXXXXExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container());
  }
}
