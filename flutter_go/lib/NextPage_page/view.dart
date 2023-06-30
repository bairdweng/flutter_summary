import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'action.dart';
import 'state.dart';
import '../父子组件/parent_child_component.dart';

//1. 创建 globalKey
GlobalKey<ParentChildComponentStatus> childKey = GlobalKey();

MethodChannel _channel;
void _incrementCounter() {
  _channel.invokeListMethod("nextVc");
  childKey.currentState?.callHello();
}

Widget buildView(
    NextPageState state, Dispatch dispatch, ViewService viewService) {
  _channel = const MethodChannel('multiple-flutters');
  _channel.setMethodCallHandler((call) async {
    // print(call);
    debugPrint(call.method);
  });
  return Scaffold(
    appBar: AppBar(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      title: const Text("我是第二个页面"),
    ),
    body: Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Colors.purple,
            width: 100,
            height: 300,
            child: const MYNativeView(),
          ),
          ParentChildComponent(
              key: childKey,
              testCallBack: (val) {
                debugPrint("hello，你是谁啊$val");
              }),
        ],
      ),
    ),
    floatingActionButton: const FloatingActionButton(
      heroTag: "66666",
      onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: Icon(Icons.add),
    ), // This trailing comma makes auto-formatting nicer for build methods.
  );
}

class MYNativeView extends StatelessWidget {
  const MYNativeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String viewType = 'platform_text_view';
    // final Map<String, dynamic> creationParams = <String, dynamic>{};
    // creationParams.addEntries(<String, dynamic>{"test": "123123"});
    return const UiKitView(
      viewType: viewType,
      layoutDirection: TextDirection.ltr,
      creationParams: {"test": "我是Flutter，为啥要对抗呢，草3333"},
      creationParamsCodec: StandardMessageCodec(),
    );
  }
}
