import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollContainerExample extends StatefulWidget {
  const ScrollContainerExample({Key? key, required this.title})
      : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() => ScrollContainerExampleState();
}

class ScrollContainerExampleState extends State<ScrollContainerExample> {
  String _progress = "0%"; //保存进度百分比

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: initScrollBar());
  }

  Widget initScrollBar() {
    return Scrollbar(
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          double progress = notification.metrics.pixels /
              notification.metrics.maxScrollExtent;
          //重新构建
          setState(() {
            _progress = "${(progress * 100).toInt()}%";
          });
          // ignore: avoid_print
          print("BottomEdge: ${notification.metrics.extentAfter == 0}");
          return false;
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ListView.builder(
              itemCount: 100,
              itemExtent: 50.0,
              itemBuilder: (context, index) => ListTile(title: Text("$index")),
            ),
            CircleAvatar(
              //显示进度百分比
              radius: 30.0,
              child: Text(_progress),
              backgroundColor: Colors.black54,
            )
          ],
        ),
      ),
    );
  }
}
