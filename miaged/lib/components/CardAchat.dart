import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miaged/pages/navigation/Detail.dart';

class CardAchat extends StatelessWidget {
  String id;
  String image;
  int prix;
  String taille;
  String titre;
  String description;
  bool hasButton;

  CardAchat(
      {this.image,
      this.prix,
      this.taille,
      @required this.titre,
      @required this.description,
      this.hasButton = !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!false}); //lol xd

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
        if (hasButton)
          RaisedButton(
              onPressed: (() => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Detail(
                            image: image,
                            prix: prix,
                            taille: taille,
                            titre: titre,
                            description: description)),
                  )),
              child: Text('Détails'),
              color: Colors.blueAccent)
      ],
    ));
  }
}
