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

  Stream<QuerySnapshot> getUserInformation() {
    try {
      return user.snapshots();
    } catch (e) {
      return e.message;
    }
  }

  Future<void> changePassword({newPassword}) async {
    await _firebaseAuth.currentUser.updatePassword(newPassword);
  }
}
