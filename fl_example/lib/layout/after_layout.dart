import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AfterLayoutExample extends StatefulWidget {
  const AfterLayoutExample({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() => AfterLayoutExampleState();
}

class AfterLayoutExampleState extends State<AfterLayoutExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text("敬请期待"),
      ),
    );
  }
}
