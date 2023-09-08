//@dart=2.17
import 'package:flutter/material.dart';

class YuanliExample extends StatefulWidget {
  const YuanliExample({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() => YuanliExampleState();
}

class YuanliExampleState extends State<YuanliExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: buildContent(),
    );
  }

  Widget buildContent() {
    return Column(
      children: [CustomHome()],
    );
  }
}

class CustomHome extends Widget {
  const CustomHome({Key? key}) : super(key: key);

  @override
  Element createElement() {
    return HomeTextView(this);
  }
}

// 这里更加底层了哦
class HomeTextView extends ComponentElement {
  HomeTextView(Widget widget) : super(widget);
  String text = "123456789";

  @override
  Widget build() {
    Color primary = Theme.of(this).primaryColor; //1
    return GestureDetector(
      child: Center(
        child: TextButton(
          child: Text(
            text,
            style: TextStyle(color: primary),
          ),
          onPressed: () {
            var t = text.split("")..shuffle();
            text = t.join();
            markNeedsBuild(); //点击后将该Element标记为dirty，Element将会rebuild
          },
        ),
      ),
    );
  }
}
