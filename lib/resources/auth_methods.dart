import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:watch_ltr/model/userModel.dart';
import 'package:watch_ltr/provider/userProvider.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel> getUserData() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();
    return UserModel.fromSnap(documentSnapshot);
  }

  Future<String> signUpUser(
      {required String userEmail,
      required String password,
      required String userName,
      required BuildContext context}) async {
    String res = 'An error occurred.';
    try {
      if (userEmail.isNotEmpty || password.isNotEmpty || userName.isNotEmpty) {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
                email: userEmail, password: password);
        userCredential = await _auth.signInWithEmailAndPassword(
            email: userEmail, password: password);

        UserModel user = UserModel.name(
          userEmail: userEmail,
          userName: userName,
          userId: userCredential.user!.uid,
          watchLaterList: [],
          watchedList: [],
        );
        await _firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(user.toJson());
        res = 'User created successfully';

        UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
        await userProvider.refreshUser();
        print(userProvider.getUserModel.userName);
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'invalid-email') res = 'Wrong Email format';
      if (error.code == 'weak-password') res = 'Weak Password';
      if (error.code == 'email-already-in-use')
        res = 'Email already linked with another account.';
    }
    return res;
  }

  Future<String> logInUser(
      {required String userEmail,
      required String password,
      required BuildContext context}) async {
    String res = 'An error occurred.';

    try {
      if (userEmail.isNotEmpty || password.isNotEmpty) {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
            email: userEmail, password: password);
        res = 'success';
        UserModel user =
            Provider.of<UserProvider>(context, listen: false).getUserModel;
        user = await getUserData();
      } else {
        res = 'Please try again.';
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'invalid=email') res = 'Wrong email format';
      if (error.code == 'user-not-found')
        res = 'No user found. Please sign up and try again.';
      else
        res = error.code.toString();
    }

    return res;
  }
}
