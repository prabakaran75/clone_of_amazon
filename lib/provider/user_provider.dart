import 'package:clone_of_amazon/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserModel _user = UserModel(
      id: "",
      name: "",
      email: "",
      password: "",
      address: "",
      type: "",
      token: "");
  UserModel get user => _user;

  void setUser(String user) {
    _user = UserModel.fromJson(user);
    notifyListeners();
  }
}
