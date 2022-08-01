class MixExampleClassA {
  void printClassA() {}
}

class MixExampleClassB {
  void printClassB() {}
}

class MixExampleClassC {
  void printClassC() {}
}

class MixExample extends Object
    with MixExampleClassA, MixExampleClassB, MixExampleClassC {
  @override
  void printClassA() {}
  @override
  void printClassC() {}
  @override
  void printClassB() {}
}
