import 'package:flutter/material.dart';
import './provicer_counter.dart';
import 'package:provider/provider.dart';

class ProviderBottom extends StatefulWidget {
  const ProviderBottom({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ProviderBottomStatus();
  }
}

class ProviderBottomStatus extends State<ProviderBottom> {
  @override
  Widget build(BuildContext context) {
    int countVal = context.watch<Counter>().count;
    return Container(
        margin: const EdgeInsets.all(10),
        color: Colors.red,
        child: Text('hello我也监听着你呢：$countVal'));
  }
}
