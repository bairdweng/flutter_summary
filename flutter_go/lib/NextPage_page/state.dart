import 'package:fish_redux/fish_redux.dart';

class NextPageState implements Cloneable<NextPageState> {
  @override
  NextPageState clone() {
    return NextPageState();
  }
}

NextPageState initState(Map<String, dynamic> args) {
  return NextPageState();
}
