import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late String userEmail;
  late String userName;
  late String userId;
  late List<String> watchLaterList;
  late List<String> watchedList;

  UserModel.name({
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

  static UserModel fromSnap(DocumentSnapshot documentSnapshot) {
    var snapshot = documentSnapshot.data() as Map<String, dynamic>;
    return UserModel.name(
      userEmail: snapshot['userEmail'],
      userName: snapshot['userName'],
      userId: snapshot['userId'],
      watchLaterList: snapshot['watchLaterList'],
      watchedList: snapshot['watchedList'],
    );
  }
}
