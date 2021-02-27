import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:miaged/services/user_service.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
String userLogin = UserService.getUsername();
CollectionReference articles = db.collection('articles');
CollectionReference panier =
    db.collection('user').doc('$userLogin').collection('panier');

class ArticleService {
  Stream<QuerySnapshot> getArticles() {
    try {
      return articles.snapshots();
    } catch (e) {
      return e.message;
    }
  }

  void ajouterAuPanier({image, prix, taille, titre, description}) {
    panier.add({
      "image": image,
      "prix": prix,
      "taille": taille,
      "titre": titre,
      "description": description
    });
  }

  Stream<QuerySnapshot> getPanier() {
    try {
      return panier.snapshots();
    } catch (e) {
      return e.message;
    }
  }

  void supprimerArticlePanier({id}) {
    try {
      panier.doc(id).delete();
    } catch (e) {
      return e.message;
    }
  }
}
