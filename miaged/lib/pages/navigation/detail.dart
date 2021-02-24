import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final String id;
  final String image;
  final int prix;
  final String taille;
  final String titre;
  final String description;

  Detail(this.id, this.image, this.prix, this.taille, this.titre,
      this.description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("$titre"),
        ),
        body: Center(
          child: Column(children: []),
        ),
        bottomNavigationBar: ButtonTheme(
            height: 70,
            child: RaisedButton(
                color: Colors.lightGreenAccent,
                onPressed: (() => {}),
                child: Text('Ajouter au panier'))));
  }
}
