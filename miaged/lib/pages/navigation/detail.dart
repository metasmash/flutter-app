import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final String image;
  final int prix;
  final String taille;
  final String titre;
  final String description;

  Detail(this.image, this.prix, this.taille, this.titre, this.description);
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
                onPressed: (() =>
                    AddArticle(image, prix, taille, titre, description)),
                child: Text('Ajouter au panier'))));
  }
}

class AddArticle {
  final String image;
  final int prix;
  final String taille;
  final String titre;
  final String description;
  static String email = FirebaseAuth.instance.currentUser.email;

  AddArticle(this.image, this.prix, this.taille, this.titre, this.description) {
    FirebaseFirestore.instance
        .collection('user')
        .doc('$email')
        .collection('panier')
        .add({
      "image": image,
      "prix": prix,
      "taille": taille,
      "titre": titre,
      "description": description
    });
  }
}
