# fish_redux 初体验



#### 1.  环境

```
version: 1.0.0+1
environment:
  sdk: ">=2.8.0 <3.0.0"
dependencies:
  flutter:
    sdk: flutter
  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.2
  fish_redux: ^0.3.7
```

#### 2. vscode 相关工具[fish-redux-template](https://marketplace.visualstudio.com/items?itemName=huangjianke.fish-redux-template)

创建模板工程，commad+shift+p 输入fish 选择gen page temple即可。

#### 4. 路由

##### 4.1 配置

```dart
final AbstractRoutes routes = PageRoutes(
  pages: {"CountPage": HomePagePage(), "NextPage": NextPagePage()},
);

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: routes.buildPage("CountPage", null),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return routes.buildPage(settings.name, settings.arguments);
          },
          settings: settings,
        );
      },
    );
  }
}
```

##### 4.2 打开一个页面

通常在effect页面，这里直接可以打开NextPage

```dart
void _openNextPage(Action action, Context<HomePageState> ctx) async {
  var result = await Navigator.of(ctx.context).pushNamed("NextPage");
  debugPrint('result：$result');
}
```

#### 5. 各个文件的作用

##### 5.1 首先当然是View

```dart
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'action.dart';
import 'state.dart';
Widget buildView(
    HomePageState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
      ),
      body: Center(
          child: Row(children: [
        Container(
          color: Colors.yellow,
          child: FloatingActionButton(
            onPressed: () {
              debugPrint("hello nimas  ddd");
              dispatch(HomePageActionCreator.countIncrease());
            },
            child: const Icon(Icons.add),
          ),
        ),
        FloatingActionButton(
          heroTag: "336",
          onPressed: () {
            debugPrint("打开下一个页面");
            dispatch(HomePageActionCreator.openNextPage());
          },
          child: const Icon(Icons.open_in_browser),
        ),
        Text("${state.count}")
      ])));
}
```



##### 5.2 action

```dart
import 'package:fish_redux/fish_redux.dart';

enum HomePageAction { action, increase, updateCount, openNextPage }

// 相当于所有的方法都写在这里
class HomePageActionCreator {
  static Action onAction() {
    return const Action(HomePageAction.action);
  }

  ///去reducer层更新数据，传参可以放在Action类中的payload字段中，payload是dynamic类型，可传任何类型
  static Action countIncrease() {
    return const Action(HomePageAction.increase);
  }

  static Action updateCount(int count) {
    return Action(HomePageAction.updateCount, payload: count);
  }

  static Action openNextPage() {
    return const Action(HomePageAction.openNextPage);
  }
}

```

##### 5.3 effect

这里主要写某些方法的实现

```dart
// 这里写方法的实现吗
Effect<HomePageState> buildEffect() {
  return combineEffects(<Object, Effect<HomePageState>>{
    HomePageAction.increase: _onIncrease,
    HomePageAction.openNextPage: _openNextPage
  });
}

///自增数
void _onIncrease(Action action, Context<HomePageState> ctx) {
  ///处理自增数逻辑
  int count = ctx.state.count + 1;
  ctx.dispatch(HomePageActionCreator.updateCount(count));
}

void _openNextPage(Action action, Context<HomePageState> ctx) async {
  var result = await Navigator.of(ctx.context).pushNamed("NextPage");
  debugPrint('a=======================$result');
}

```
##### 5.4 page
 页面来的，几乎不用怎么变动

##### 5.5 state
 这里的state已经被重新封装了，重新看看即可
```dart
import 'package:fish_redux/fish_redux.dart';

class HomePageState implements Cloneable<HomePageState> {
  int count;
  @override
  HomePageState clone() {
    return HomePageState()..count = count;
  }
}

HomePageState initState(Map<String, dynamic> args) {
  return HomePageState()..count = 0;
}

```





