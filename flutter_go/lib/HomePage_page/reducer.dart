import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomePageState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomePageState>>{
      HomePageAction.updateCount: _updateCount,
    },
  );
}

HomePageState _updateCount(HomePageState state, Action action) {
  final HomePageState newState = state.clone();
  newState.count = action.payload;
  return newState;
}
