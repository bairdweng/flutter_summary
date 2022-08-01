import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './inherited_parent.dart';

class InheriedExample extends StatefulWidget {
  const InheriedExample({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() => InheriedExampleState();
}

class InheriedExampleState extends State<InheriedExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          child: Row(
            children: [exampleB()],
          ),
        ));
  }

  Widget exampleB() {
    var view = Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: const InheritedWidgetTestRoute(),
        width: 200,
        height: 200,
        color: Colors.yellow);
    return view;
  }
}
