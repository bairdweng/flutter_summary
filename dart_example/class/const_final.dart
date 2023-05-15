


class ConstExample extends Object {
  // 意思是运行的时候赋值
   final testA;
   ConstExample(this.testA);
   sayHell() {
    // 常量嘛，定下就不能改变啦
     const tt = "120";
    //  tt = "200"
     print(tt);
   }
}