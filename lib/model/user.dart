import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  late String userEmail;
  late String userName;
  late String userId;
  late List<String> watchLaterList;
  late List<String> watchedList;

  User.name({
    required this.userEmail,
    required this.userName,
    required this.userId,
    required this.watchLaterList,
    required this.watchedList,
  });

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'userId': userId,
        'userEmail': userEmail,
        'watchLaterList': watchLaterList,
        'watchedList': watchedList
      };

  static User fromSnap(DocumentSnapshot documentSnapshot) {
    var snapshot = documentSnapshot.data() as Map<String, dynamic>;
    return User.name(
      userEmail: snapshot['userEmail'],
      userName: snapshot['userName'],
      userId: snapshot['userId'],
      watchLaterList: snapshot['watchLaterList'],
      watchedList: snapshot['watchedList'],
    );
  }
}
