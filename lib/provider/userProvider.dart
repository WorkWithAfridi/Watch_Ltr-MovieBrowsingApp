import 'package:flutter/cupertino.dart';
import 'package:watch_ltr/model/userModel.dart';
import 'package:watch_ltr/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  late UserModel _user = UserModel.name(
    userEmail: 'userEmail',
    userName: 'userName',
    userId: 'userId',
    watchLaterList: [],
    watchedList: [],
  );
  final AuthMethods _authMethods = AuthMethods();

  UserModel get getUserModel => _user;

  set user(UserModel value) {
    _user = value;
  }

  Future<void> refreshUser() async {
    UserModel user = await _authMethods.getUserData();
    _user = user;
    notifyListeners();
  }
}
