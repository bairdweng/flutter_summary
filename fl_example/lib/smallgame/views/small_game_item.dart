//@dart=2.17
import 'package:fl_example/smallgame/models/small_game_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SmallGameItemViewExample extends StatefulWidget {
  const SmallGameItemViewExample({Key? key, required this.model})
      : super(key: key);
  final SmallGameModel model;
  @override
  State<StatefulWidget> createState() =>
      // ignore: no_logic_in_create_state
      SmallGameItemViewExampleState(model: model);
}

class SmallGameItemViewExampleState extends State<SmallGameItemViewExample> {
  SmallGameModel model;
  bool selected = false;
  SmallGameItemViewExampleState({required this.model});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: Text(model.name ?? ""),
      ),
      decoration: BoxDecoration(
          color: model.selected == true ? Colors.red : Colors.white,
          border: Border.all(
              color: Colors.grey, width: 1, style: BorderStyle.solid)),
    ));
  }
}
