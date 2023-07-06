import 'dart:ffi';

import 'package:fish_redux/fish_redux.dart';

class HomePageState implements Cloneable<HomePageState> {
  int count;
  int page;
  bool showStackView;
  @override
  HomePageState clone() {
    return HomePageState()
      ..count = count
      ..showStackView = showStackView
      ..page = page;
  }
}

HomePageState initState(Map<String, dynamic> args) {
  return HomePageState()
    ..count = 0
    ..showStackView = false
    ..page = 0;
}
