import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vinted/pages/navigation/detail.dart';

class CardAchat extends StatelessWidget {
  final String id;
  final String image;
  final int prix;
  final String taille;
  final String titre;
  final String description;

  CardAchat(this.id, this.image, this.prix, this.taille, this.titre,
      this.description);

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
                          Detail(id, image, prix, taille, titre, description)),
                )),
            child: Text('Détails'),
            color: Colors.blueAccent)
      ],
    ));
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
