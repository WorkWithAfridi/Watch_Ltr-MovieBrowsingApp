import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:watch_ltr/model/userModel.dart';
import 'package:watch_ltr/provider/userProvider.dart';

class FirebaseMethods {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addShowToWatchLaterList(
      String showId, BuildContext context) async {
    UserModel user =
        Provider.of<UserProvider>(context, listen: false).getUserModel;
    // String res = 'An error occurred...';

    await _firebaseFirestore.collection('users').doc(user.userId).update({
      'watchLaterList': FieldValue.arrayUnion([showId])
    });

  }
}
