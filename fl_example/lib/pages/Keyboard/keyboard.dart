//@dart=2.17
import 'package:flutter/material.dart';

class KeyboardExample extends StatefulWidget {
  const KeyboardExample({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() => KeyboardExampleState();
}

class KeyboardExampleState extends State<KeyboardExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SafeArea(child: buildContent()));
  }

  Widget buildContent() {
    final screenSize = MediaQuery.of(context).size;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: Container(
          color: Colors.yellow,
          height: 300,
        )),
        SliverToBoxAdapter(
            child: Container(
          color: Colors.red,
          height: screenSize.height -
              300 -
              MediaQuery.of(context).padding.bottom -
              MediaQuery.of(context).padding.top -
              MediaQuery.of(context).padding.top,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [TextField()],
          ),
        )),
      ],
    );
    /*
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          color: Colors.red,
          height: 500,
        ),
        TextField()
      ],
    );*/
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
