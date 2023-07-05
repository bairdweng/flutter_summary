// ignore: import_of_legacy_library_into_null_safe
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    HomePageState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
      ),
      body: Center(
          child: Row(children: [
        Container(
          color: Colors.yellow,
          child: FloatingActionButton(
            onPressed: () {
              debugPrint("hello nimas  ddd");
              dispatch(HomePageActionCreator.countIncrease());
            },
            child: const Icon(Icons.add),
          ),
        ),
        FloatingActionButton(
          heroTag: "336",
          onPressed: () {
            debugPrint("打开下一个页面");
            dispatch(HomePageActionCreator.openNextPage());
          },
          child: const Icon(Icons.open_in_browser),
        ),
        Text("${state.count}"),
        Container(
          padding: const EdgeInsets.only(left: 5),
          child: Text("${state.page}"),
        )
      ])));
}

Widget _buildTestView(
    HomePageState state, Dispatch dispatch, ViewService viewService) {}
