class OptionsClass {
  String? firstName;
  String? lastName;
  // 可选参数
  OptionsClass({this.firstName, this.lastName}) {}
  void callLog() {
    String name = this.lastName ?? '';
    print('可选参数的类姓名：$firstName$name');
  }
}
