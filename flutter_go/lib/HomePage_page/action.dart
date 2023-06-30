import 'package:fish_redux/fish_redux.dart';

enum HomePageAction { action, increase, updateCount, openNextPage }

// 相当于所有的方法都写在这里
class HomePageActionCreator {
  static Action onAction() {
    return const Action(HomePageAction.action);
  }

  ///去reducer层更新数据，传参可以放在Action类中的payload字段中，payload是dynamic类型，可传任何类型
  static Action countIncrease() {
    return const Action(HomePageAction.increase);
  }

  static Action updateCount(int count) {
    return Action(HomePageAction.updateCount, payload: count);
  }

  static Action openNextPage() {
    return const Action(HomePageAction.openNextPage);
  }
}
