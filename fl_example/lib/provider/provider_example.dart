//@dart=2.17
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './provicer_counter.dart';
import './provider_bottom_widget.dart';

class ProviderExample extends StatefulWidget {
  const ProviderExample({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() => ProviderExampleState();
}

class ProviderExampleState extends State<ProviderExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [getMyCenter(), const ProviderBottom()],
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('increment_floatingActionButton'),
        // 1. 这里将公共的组件++嘛
        onPressed: () => context.read<Counter>().increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  // 2. 然后这里监听一下嘛
  Widget getMyCenter() {
    int countVal = context.watch<Counter>().count;
    return Center(
      child: Text(

          /// Calls `context.watch` to make [Count] rebuild when [Counter] changes.
          '$countVal',
          key: const Key('counterState'),
          style: Theme.of(context).textTheme.headline4),
    );
  }
}
