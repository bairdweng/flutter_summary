// ignore: import_of_legacy_library_into_null_safe
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    HomePageState state, Dispatch dispatch, ViewService viewService) {
  return Row(children: [
    Container(
      width: 100,
      height: 50,
      child: FloatingActionButton(
        onPressed: () {
          debugPrint("hello nima");
          dispatch(HomePageActionCreator.countIncrease());
        },
        child: const Icon(Icons.add),
      ),
    ),
    Text("0" + state.count.toString())
    // ignore: prefer_interpolation_to_compose_strings
  ]);
}
