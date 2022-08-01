import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './views/small_game_bg.dart';
import './views/small_game_box.dart';

class SmallGameExample extends StatefulWidget {
  const SmallGameExample({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() => SmallGameExampleState();
}

class SmallGameExampleState extends State<SmallGameExample> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: initBody());
  }

  Widget initBody() {
    return Stack(
      children: const [SmallGameBgView(), SmallGameBoxView()],
    );
  }
}
