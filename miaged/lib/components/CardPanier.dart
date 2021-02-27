import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miaged/pages/navigation/Detail.dart';
import 'package:miaged/services/articles_service.dart';

class CardPanier extends StatelessWidget {
  String image;
  int prix;
  String taille;
  String titre;
  String description;
  String id;

  CardPanier(
      {this.image,
      this.prix,
      this.taille,
      this.titre,
      this.description,
      this.id});

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
            onPressed: (() => ArticleService().supprimerArticlePanier(id: id)),
            child: Text('Supprimer'),
            color: Colors.red)
      ],
    ));
  }
}
