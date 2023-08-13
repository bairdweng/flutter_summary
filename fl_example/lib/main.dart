import 'package:fl_example/models/home_item.dart';
import 'package:fl_example/pb/test.pb.dart';
import 'package:flutter/material.dart';
import './router/router.dart';
import 'package:provider/provider.dart';
import './provider/provicer_counter.dart';
import '../pb/test.pbenum.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello world',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: MYRouter().getRouters(),
      home: const MyHomePage(title: 'Hello'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MYRouter router = MYRouter();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: initBody(),
    );
  }

  Widget initBody() {
    try {
      var info = ConvGroupAtInfo();
      info.atType = ApplyJoinOpt.valueOf(3)!;
      print("type=========${info.atType}");
    } catch (e) {
      print("type error=========${e}");
    }

    return ListView(
      children: initListItems(),
    );
  }

  List<Widget> initListItems() {
    List<Widget> list = <Widget>[];
    for (HomeItem item in getItems()) {
      var widget = GestureDetector(
        child: Container(
          height: 44,
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          color: Colors.grey,
          child: Row(
            children: [
              Container(
                  margin: const EdgeInsets.all(0), child: Text(item.title))
            ],
          ),
        ),
        onTap: () => clickOnTheRow(item),
      );
      list.add(widget);
    }
    return list;
  }

  void clickOnTheRow(HomeItem item) {
    router.openPage(context, item.routerName);
  }

  List<HomeItem> getItems() {
    return router.getRouterItems();
  }
}
