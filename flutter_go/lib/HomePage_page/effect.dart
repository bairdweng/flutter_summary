import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

import 'package:flutter/cupertino.dart' hide Action;
import 'package:flutter/material.dart' hide Action;

// 这里应该是处理各种方法的调用
Effect<HomePageState> buildEffect() {
  return combineEffects(<Object, Effect<HomePageState>>{
    HomePageAction.increase: _onIncrease,
    HomePageAction.openNextPage: _openNextPage,
    HomePageAction.openSecondPage: _openSecondPage,
  });
}

///自增数
void _onIncrease(Action action, Context<HomePageState> ctx) {
  ///处理自增数逻辑
  int count = ctx.state.count + 1;
  ctx.dispatch(HomePageActionCreator.updateCount(count));
}

void _openNextPage(Action action, Context<HomePageState> ctx) async {
  await Navigator.of(ctx.context).pushNamed("ListPage");
}

void _openSecondPage(Action action, Context<HomePageState> ctx) async {
  await Navigator.of(ctx.context).pushNamed("NextPage");
}
