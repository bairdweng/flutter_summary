import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

import 'package:flutter/cupertino.dart' hide Action;
import 'package:flutter/material.dart' hide Action;

// 这里写方法的实现吗
Effect<HomePageState> buildEffect() {
  return combineEffects(<Object, Effect<HomePageState>>{
    HomePageAction.increase: _onIncrease,
    HomePageAction.openNextPage: _openNextPage
  });
}

///自增数
void _onIncrease(Action action, Context<HomePageState> ctx) {
  ///处理自增数逻辑
  int count = ctx.state.count + 1;
  ctx.dispatch(HomePageActionCreator.updateCount(count));
}

void _openNextPage(Action action, Context<HomePageState> ctx) async {
  var result = await Navigator.of(ctx.context).pushNamed("ListPage");
  debugPrint('a=======================$result');
}
