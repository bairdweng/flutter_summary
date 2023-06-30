import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum NextPageAction { action }

class NextPageActionCreator {
  static Action onAction() {
    return const Action(NextPageAction.action);
  }
}
