import 'dart:async';

class AsyncExample {
  void run() async {
    String nickName = await getNickName();
    String lastName = await getLastName();
    print('hello $nickName$lastName');
  }

  Future<String> getNickName() async {
    return Future(() {
      Future.delayed(const Duration(seconds: 1));
      print("int call...");
      return "hello 'bairdweng'";
    });
  }

  Future<String> getLastName() async {
    return Future(() {
      Future.delayed(const Duration(seconds: 3));
      print("int call...");
      return "hello 'bairdweng'";
    });
  }
}
