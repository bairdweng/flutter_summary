import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(ListState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text("ListPage"),
      backgroundColor: Colors.black12,
    ),
    body: _itemWidget(state, viewService),
  );
}

Widget _itemWidget(ListState state, ViewService viewService) {
  if (state.items != null) {
    ///使用列表
    return ListView.builder(
      itemBuilder: viewService.buildAdapter().itemBuilder,
      itemCount: viewService.buildAdapter().itemCount,
    );
  } else {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
