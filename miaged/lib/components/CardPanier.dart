import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vinted/pages/navigation/detail.dart';

class CardPanier extends StatelessWidget {
  final String image;
  final int prix;
  final String taille;
  final String titre;
  final String description;

  CardPanier(this.image, this.prix, this.taille, this.titre, this.description);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        Text('$titre'),
        Image.network(image),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('$prix €'),
            Text('Taille: $taille'),
          ],
        ),
        RaisedButton(
            onPressed: (() => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Detail(image, prix, taille, titre, description)),
                )),
            child: Text('Détails'),
            color: Colors.red)
      ],
    ));
  }
}
