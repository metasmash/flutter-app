import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miaged/services/articles_service.dart';
import 'package:miaged/components/CardAchat.dart';

class Detail extends StatelessWidget {
  final String image;
  final int prix;
  final String taille;
  final String titre;
  final String description;

  Detail({this.image, this.prix, this.taille, this.titre, this.description});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("$titre"),
        ),
        body: Column(
          children: [
            CardAchat(
              image: image,
              prix: prix,
              taille: taille,
              titre: titre,
              description: description,
              hasButton: false,
            ),
            Text(description)
          ],
        ),
        bottomNavigationBar: ButtonTheme(
            height: 70,
            child: RaisedButton(
                color: Colors.lightGreenAccent,
                onPressed: (() => ArticleService().ajouterAuPanier(
                    image: image,
                    prix: prix,
                    taille: taille,
                    titre: titre,
                    description: description)),
                child: Text('Ajouter au panier'))));
  }
}
