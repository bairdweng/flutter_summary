import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<HomePageState> buildEffect() {
  return combineEffects(<Object, Effect<HomePageState>>{
    HomePageAction.increase: _onIncrease,
  });
}

///自增数
void _onIncrease(Action action, Context<HomePageState> ctx) {
  ///处理自增数逻辑
  int count = ctx.state.count + 1;
  ctx.dispatch(HomePageActionCreator.updateCount(count));
}
