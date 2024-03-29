import 'package:amazon_clone/models/user_model.dart';

import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    email: '',
    id: '',
    name: '',
    password: '',
    address: '',
    type: '',
    token: '',
    cart: [],
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void updateUser(User user) {
    _user = user;
    notifyListeners();
  }
}
