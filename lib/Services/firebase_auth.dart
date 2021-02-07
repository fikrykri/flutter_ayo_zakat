import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ayo_zakat/Services/database.dart';

class AuthService {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SignInSignUpResult> createUser(
      {String email, String pass, String name, String images}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);

      await DatabaseService(uid: result.user.uid).updateUserData(name, images);
      return SignInSignUpResult(user: result.user);
    } on FirebaseAuthException catch (e) {
      return SignInSignUpResult(message: e.toString());
    }
  }

  static Future<SignInSignUpResult> signInWithEmail(
      {String email, String pass}) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      return SignInSignUpResult(user: result.user);
    } on FirebaseAuthException catch (e) {
      return SignInSignUpResult(message: e.toString());
    }
  }

  // Future<void> addUserToDB(
  //     {String uid, String username, String email, DateTime timestamp}) async {
  //   userModel = UserModel(
  //       uid: uid, username: username, email: email, timestamp: timestamp);

  //   await userRef.doc(uid).set(userModel.toMap(userModel));
  // }

  // Future<UserModel> getUserFromDB({String uid}) async {
  //   final DocumentSnapshot doc = await userRef.doc(uid).get();

  //   return UserModel.fromMap(doc.data());
  // }

  static void signOut() {
    _auth.signOut();
  }
}

class SignInSignUpResult {
  final User user;
  final String message;

  SignInSignUpResult({this.user, this.message});
}
