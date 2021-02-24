import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardCustom extends StatelessWidget {
  final String id;
  final String image;
  final int prix;
  final String taille;
  final String titre;

  CardCustom(this.id, this.image, this.prix, this.taille, this.titre);

  @override
  Widget build(BuildContext context) {
    return Card(child: Column());
  }
}

//height: 300,
//decoration: BoxDecoration(
//color: Colors.white,
//image: DecorationImage(image: NetworkImage(image))),
//child: Card(
//color: Colors.transparent,
//child: Column(
//children: [Text('$titre'), Text('$prix'), Text('$taille')]))
