// ignore: import_of_legacy_library_into_null_safe
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    HomePageState state, Dispatch dispatch, ViewService viewService) {
  return Stack(
    children: [
      Scaffold(
          appBar: AppBar(
            title: const Text("首页"),
          ),
          body: Center(
              child: Column(
            children: [
              Row(children: [
                Container(
                  color: Colors.yellow,
                  child: FloatingActionButton(
                    onPressed: () {
                      dispatch(HomePageActionCreator.countIncrease());
                      dispatch(HomePageActionCreator.openSecondPage());
                    },
                    child: const Icon(Icons.add),
                  ),
                ),
                FloatingActionButton(
                  heroTag: "336",
                  onPressed: () {
                    dispatch(HomePageActionCreator.openNextPage());
                  },
                  child: const Icon(Icons.open_in_browser),
                ),
                Text("${state.count}"),
                Container(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text("${state.showStackView}"),
                )
              ]),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: _buildItems(state, dispatch, viewService),
              ),
            ],
          ))),
      state.showStackView
          ? _buildStackView(state, dispatch, viewService)
          : Container()
    ],
  );
}

Widget _buildItems(
    HomePageState state, Dispatch dispatch, ViewService viewService) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      ElevatedButton(
        child: const Text("随便打开一个页面"),
        onPressed: () {
          dispatch(HomePageActionCreator.openSecondPage());
        },
      ),
      ElevatedButton(
        child: const Text("打开一个List"),
        onPressed: () {
          dispatch(HomePageActionCreator.openNextPage());
        },
      ),
      ElevatedButton(
        child: const Text("打开一个弹框"),
        onPressed: () {
          dispatch(HomePageActionCreator.showStackView(!state.showStackView));
        },
      )
    ],
  );
}

Widget _buildStackView(
    HomePageState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
      backgroundColor: Colors.green,
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
          children: <Widget>[
            Container(
              color: Colors.red,
              child: const Text("Hello world",
                  style: TextStyle(color: Colors.white)),
            ),
            const Positioned(
              left: 18.0,
              child: Text("I am Jack"),
            ),
            const Positioned(
              top: 18.0,
              child: Text("Your friend"),
            ),
            ElevatedButton(
              child: const Text("关闭当前弹框"),
              onPressed: () {
                dispatch(HomePageActionCreator.showStackView(false));
              },
            )
          ],
        ),
      ));
}
