//@dart=2.17
import 'package:flutter/material.dart';

class SmallGameBgView extends StatefulWidget {
  const SmallGameBgView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SmallGameViewState();
  }
}

class SmallGameViewState extends State<SmallGameBgView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      padding: const EdgeInsets.all(0),
    );
  }
}
