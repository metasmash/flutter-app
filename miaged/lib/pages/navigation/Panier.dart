import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:miaged/components/CardPanier.dart';
import 'package:miaged/services/articles_service.dart';

class Panier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: ArticleService().getPanier(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData) {
          var data = snapshot.data;
          return Scaffold(
              body: CustomScrollView(
                primary: false,
                slivers: <Widget>[
                  SliverPadding(
                    padding: const EdgeInsets.all(20),
                    sliver: SliverGrid.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: 0.68,
                      children: data.docs
                          .map<Widget>((e) => Container(
                              child: CardPanier(
                                  image: e['image'],
                                  prix: e['prix'],
                                  taille: e['taille'],
                                  titre: e['titre'],
                                  description: e['description'],
                                  id: e.id)))
                          .toList(),
                    ),
                  ),
                ],
              ),
              bottomSheet: Container(
                  height: 30,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(color: Colors.pinkAccent.withOpacity(0.2)),
                  child: Center(
                      child: Text('Nombre d\'article: ${data.docs.length}'))));
        }

        return LoadingBumpingLine.circle(
            borderColor: Colors.cyan,
            backgroundColor: Colors.redAccent,
            duration: Duration(milliseconds: 80));
      },
    );
  }
}
