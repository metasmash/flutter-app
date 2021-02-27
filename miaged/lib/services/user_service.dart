import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
CollectionReference user = db
    .collection('user')
    .doc(UserService.getUsername())
    .collection('information');

class UserService {
  final FirebaseAuth _firebaseAuth;

  UserService(this._firebaseAuth);

  static String getUsername() => FirebaseAuth.instance.currentUser.email;

  Future<DocumentSnapshot> getUserInformation() {
    try {
      return user.doc('0').get();
    } catch (e) {
      return e.message;
    }
  }

  void setUserInformation({adresse, anniversaire, ville, zipcode}) {
    try {
      user.doc('0').update({
        "adresse": adresse,
        "anniversaire": anniversaire,
        "ville": ville,
        "zipcode": zipcode
      });
    } catch (e) {
      print(e.message);
    }
  }

  void changePassword({String newPassword}) async {
    try {
      _firebaseAuth.currentUser.updatePassword(newPassword);
    } catch (e) {
      print(e.message);
    }
  }
}
