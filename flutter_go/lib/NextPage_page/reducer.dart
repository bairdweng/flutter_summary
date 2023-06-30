import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<NextPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<NextPageState>>{
      NextPageAction.action: _onAction,
    },
  );
}

NextPageState _onAction(NextPageState state, Action action) {
  final NextPageState newState = state.clone();
  return newState;
}
