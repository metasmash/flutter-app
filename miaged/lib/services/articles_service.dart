import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:loading/loading.dart';
import 'package:vinted/components/CardAchat.dart';

class GetArticles extends StatelessWidget {
  final String documentId = '1';

  GetArticles();

  @override
  Widget build(BuildContext context) {
    CollectionReference articles =
        FirebaseFirestore.instance.collection('articles');

    return FutureBuilder<DocumentSnapshot>(
      future: articles.doc(this.documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          List detail = data['detail'];
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
                  children: detail
                      .map<Widget>((e) => Container(
                          child: CardAchat(e['id'], e['image'], e['prix'],
                              e['taille'], e['titre'], e['description'])))
                      .toList(),
                ),
              ),
            ],
          );
        }

        return Loading(
            indicator: BallSpinFadeLoaderIndicator(),
            size: 70.0,
            color: Colors.pink);
      },
    );
  }
}
