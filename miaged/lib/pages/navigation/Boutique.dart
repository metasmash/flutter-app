import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:miaged/components/CardAchat.dart';
import 'package:miaged/services/articles_service.dart';

class Boutique extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: ArticleService().getArticles(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData) {
          var data = snapshot.data;
          return CustomScrollView(
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
                              child: CardAchat(
                            image: e['image'],
                            prix: e['prix'],
                            taille: e['taille'],
                            titre: e['titre'],
                            description: e['description'],
                          )))
                      .toList(),
                ),
              ),
            ],
          );
        }

        return LoadingBumpingLine.circle(
            borderColor: Colors.cyan,
            backgroundColor: Colors.redAccent,
            duration: Duration(milliseconds: 80));
      },
    );
  }
}
