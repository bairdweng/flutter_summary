//@dart=2.17
import 'package:flutter/material.dart';

import 'github_api.dart';
import 'search_widget.dart';

class RXDartExample extends StatelessWidget {
  final GithubApi api;

  const RXDartExample({Key? key, required this.api}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RxDart Github Search',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
      ),
      home: SearchScreen(api: api),
    );
  }
}
