// ignore_for_file: unused_local_variable

import 'dart:async';

import 'package:flutter/material.dart';
import './small_game_item.dart';
import '../models/small_game_data.dart';
import '../models/small_game_ short_path.dart';

class SmallGameBoxView extends StatefulWidget {
  const SmallGameBoxView({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return SmallGameBoxViewState();
  }
}

class SmallGameBoxViewState extends State<SmallGameBoxView> {
  SmallGameData gameData = SmallGameData();
  SmallGameShortPath shortPath = SmallGameShortPath();

  List<SmallGameModel> list = [];
  @override
  void initState() {
    super.initState();
    list = gameData.getListItems2x();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        initGridView(),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: TextButton(
            child: const Text("刷新"),
            onPressed: () {
              reloadListDatas();
            },
          ),
        )
      ],
    );
  }

  reloadListDatas() {
    shortPath.logPoint(1, 2);

    // return;
    // const timeout = Duration(milliseconds: 500);
    // var index = 0;
    // Timer.periodic(timeout, (timer) {
    //   if (index > list.length - 1) {
    //     index = 0;
    //     timer.cancel();
    //     return;
    //   }
    //   setState(() {
    //     gameData.resetItemIndex(list, index);
    //   });
    //   index++;
    // });
  }

  Widget initGridView() {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, //每行三列
        childAspectRatio: 1.0, //显示区域宽高相等
      ),
      children: getWidgets(),
    );
  }

  List<Widget> getWidgets() {
    List<Widget> widgets = [];
    for (var item in list) {
      SmallGameModel model = item;
      widgets.add(SmallGameItemViewExample(model: model));
    }
    return widgets;
  }

  // 叼ta老妹，这个一定要改变数组个数才能生效吗？
  Widget initItemViews() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //每行三列
          childAspectRatio: 1.0, //显示区域宽高相等
        ),
        itemCount: list.length,
        itemBuilder: (context, index) {
          SmallGameModel model = list[index];
          return SmallGameItemViewExample(model: model);
        });
  }
}
