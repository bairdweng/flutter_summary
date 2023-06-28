import 'package:flutter/material.dart';

class ParentChildComponent extends StatefulWidget {
  final void Function(String val) testCallBack;

  const ParentChildComponent({Key key, this.testCallBack}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ParentChildComponentStatus();
}

class ParentChildComponentStatus extends State<ParentChildComponent> {
  // final void Function(bool newValue) onChanged;
  // ignore: non_constant_identifier_names
  void callHello() {
    debugPrint('我是组件1的方法，现在开始呼叫我啊？');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.green,
      child: ElevatedButton(
        child: const Text("组件1"),
        onPressed: () {
          if (widget.testCallBack != null) {
            widget.testCallBack("你好我是组件1");
          }
        },
      ),
    );
  }
}
