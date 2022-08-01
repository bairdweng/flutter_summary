// 抽象类
abstract class Person {
  String? name;
  num? age;
  String? sex;
  //
  void printPersonInfo();
  // 这是一个没有实现方法体的方法，在Dart中叫抽象方法，
  void drink();
}

// 相当于协议
class Baird implements Person {
  void logName() {
    this.name = "baird";
    this.age = 10;
    this.sex = 'boy';
    printPersonInfo();
  }

  @override
  void drink() {
    print('我在喝水');
  }

  @override
  num? age;

  @override
  String? name;

  @override
  void printPersonInfo() {
    print('其实就是定义了一些协议=====$age$name');
  }

  @override
  String? sex;
}
