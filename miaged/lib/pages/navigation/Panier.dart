import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class Panier extends StatefulWidget {
  Panier({Key key}) : super(key: key);

  @override
  _Panier createState() => _Panier();
}

class _Panier extends State<Panier> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Panier", style: optionStyle)],
        ),
      ),
    );
  }
}