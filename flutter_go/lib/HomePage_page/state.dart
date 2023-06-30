import 'package:fish_redux/fish_redux.dart';

class HomePageState implements Cloneable<HomePageState> {
  int count;
  int page;
  @override
  HomePageState clone() {
    return HomePageState()
      ..count = count
      ..page = page;
  }
}

HomePageState initState(Map<String, dynamic> args) {
  return HomePageState()
    ..count = 0
    ..page = 0;
}
