import 'package:fl_example/models/home_item.dart';
import 'package:fl_example/pages/Keyboard/keyboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:fl_example/layout/widgets_example.dart';
import 'package:fl_example/layout/stack_layout.dart';
import 'package:fl_example/layout/after_layout.dart';
import 'package:fl_example/component/base_container.dart';
import 'package:fl_example/component/scroll_container.dart';
import 'package:fl_example/component/animation_list_container.dart';
import 'package:fl_example/component/gridview_container.dart';
import 'package:fl_example/smallgame/small_game_home.dart';
import 'package:fl_example/inherited/inherited_example.dart';
import 'package:fl_example/provider/provider_example.dart';
import 'package:fl_example/bloc/bloc_example.dart';
import 'package:fl_example/rxdart_example/rxdart_example.dart';
import 'package:fl_example/rxdart_example/github_api.dart';
import 'package:fl_example/app/flutter_app.dart';
import 'package:fl_example/pages/yuanli/Yuanli.dart';

import 'package:fl_example/pages/record/record_page.dart';

class MYRouter {
  final Map<String, Map<String, dynamic>> routers = {};
  // static _instance，_instance会在编译期被初始化，保证了只被创建一次
  static final MYRouter _instance = MYRouter._internal();
// 通过私有方法_internal()隐藏了构造方法，防止被误创建
  MYRouter._internal() {
    init();
  }

  void init() {
    registerRouter("键盘", "键盘", const KeyboardExample(title: "键盘"));
    registerRouter("原理", "原理", const YuanliExample(title: "原理"));
    registerRouter("RecordPage", '录音', const RecordPage(title: "录音"));
    registerRouter(
        "widgets_example", '基本的布局', const WidgetsExample(title: "基本的布局"));
    registerRouter(
        "stack_layout", '叠层布局', const StackLayoutExample(title: "叠层布局"));
    registerRouter(
        "after_layout", '响应式布局', const AfterLayoutExample(title: "响应式布局"));
    registerRouter(
        "base_container", '基本的容器', const BaseContainerExample(title: "基本的容器"));
    registerRouter("scroll_container", '滚动的容器',
        const ScrollContainerExample(title: "滚动的容器"));
    registerRouter(
        "animation_list", '动画列表', const AnimationListExample(title: "动画列表"));
    registerRouter(
        "grid_view", 'grid_view', const GridViewExample(title: "grid_view"));
    registerRouter(
        "small_game_home", '小游戏', const SmallGameExample(title: "小游戏"));
    registerRouter(
        "base_container", '数据共享', const InheriedExample(title: "数据共享"));
    registerRouter(
        "provider_example", '跨组件共享', const ProviderExample(title: "跨组件共享"));
    registerRouter("bloc_example", '跨组件共享', const BlocExample(title: "bloc"));
    registerRouter(
        "rxdart_example", 'rxdart_example', RXDartExample(api: GithubApi()));
    registerRouter("App", "来一个app", const FlutterApp(title: "来一个app吧"));
  }

  //提供了一个工厂方法来获取该类的实例
  factory MYRouter() {
    return _instance;
  }

  /// 注册路由
  void registerRouter(String name, String title, Widget page) {
    // ignore: prefer_function_declarations_over_variables
    var pageBuilder = (context) => page;
    routers[name] = {'title': title, 'page': pageBuilder};
  }

  /// 获取路由
  Map<String, WidgetBuilder> getRouters() {
    Map<String, WidgetBuilder> buildRouters = {};
    for (String key in routers.keys) {
      Map<String, dynamic>? item = routers[key];
      buildRouters[key] = item!['page'];
    }
    return buildRouters;
  }

  List<HomeItem> getRouterItems() {
    List<HomeItem> items = [];
    for (String key in routers.keys) {
      Map<String, dynamic>? item = routers[key];
      String title = item!['title'];
      HomeItem(key, title);
      items.add(HomeItem(title, key));
    }
    return items;
  }

  // 获取路由列表
  void openPage(BuildContext context, String name) {
    if (!routers.containsKey(name)) {
      return;
    }
    Navigator.pushNamed(context, name);
  }
}
