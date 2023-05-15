import './network/index.dart';

import 'class/spacecraft.dart';
import 'class/optionsclass.dart';
import 'class/ex_implements.dart';
import 'async/async_exmple.dart';
import 'class/const_final.dart';

void hello() {
  print('The number is '); // Print to console.
}

// 为什么使用final
final NetWork working = NetWork();
void main(List<String> args) {
  working.hello();
  // 构建这个类
  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();

  OptionsClass option = OptionsClass(firstName: "baird");
  option.callLog();

  Baird b = Baird();
  b.logName();

  AsyncExample ex = AsyncExample();
  ex.run();

  ConstExample("123123123").sayHell();
}
