import 'package:fish_redux/fish_redux.dart';

class HomePageState implements Cloneable<HomePageState> {
  int count;
  @override
  HomePageState clone() {
    return HomePageState()..count = count;
  }
}

HomePageState initState(Map<String, dynamic> args) {
  return HomePageState()..count = 0;
}
