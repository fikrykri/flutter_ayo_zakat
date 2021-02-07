import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData(String name, String images) async {
    return await userCollection.doc(uid).set({'name': name, 'images': images});
  }

  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }
}
