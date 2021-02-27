import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Articles {
  final String image;
  final int prix;
  final String taille;
  final String titre;
  final String description;

  Articles(this.image, this.prix, this.taille, this.titre, this.description);
}

class ArticleService {
  FirebaseFirestore db = FirebaseFirestore.instance;
  static String userLogin = FirebaseAuth.instance.currentUser.email;

  Stream<QuerySnapshot> getArticles() {
    CollectionReference articles = db.collection('articles');
    try {
      return articles.snapshots();
    } catch (e) {
      return e.message;
    }
  }

  void ajouterAuPanier({image, prix, taille, titre, description}) {
    CollectionReference panier =
        db.collection('user').doc('$userLogin').collection('panier');
    panier.add({
      "image": image,
      "prix": prix,
      "taille": taille,
      "titre": titre,
      "description": description
    });
  }

  Stream<QuerySnapshot> getPanier() {}
}
