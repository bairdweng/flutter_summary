import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<NextPageState> buildEffect() {
  return combineEffects(<Object, Effect<NextPageState>>{
    NextPageAction.action: _onAction,
  });
}

void _onAction(Action action, Context<NextPageState> ctx) {
}
