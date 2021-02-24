import 'package:flutter/material.dart';
import 'package:vinted/services/articles_service.dart';

/// This is the stateful widget that the main application instantiates.
class Acheter extends StatefulWidget {
  Acheter({Key key}) : super(key: key);

  @override
  _Acheter createState() => _Acheter();
}

class _Acheter extends State<Acheter> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetArticles(),
      ),
    );
  }
}
