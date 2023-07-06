import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

// 这里主要处理state变化逻辑
Reducer<HomePageState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomePageState>>{
      HomePageAction.updateCount: _updateCount,
      HomePageAction.showStackView: _showStackViewAction,
    },
  );
}

HomePageState _updateCount(HomePageState state, Action action) {
  final HomePageState newState = state.clone();
  newState.count = action.payload;
  return newState;
}

HomePageState _showStackViewAction(HomePageState state, Action action) {
  final HomePageState newState = state.clone();
  newState.showStackView = action.payload;
  return newState;
}
