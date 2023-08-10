import 'dart:convert';
import 'dart:math';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  void signUpUser(
      {required String name, required String email, required String password}) {
    try {
      User user = User(
        id: '',
        name: name,
        password: password,
        address: '',
        type: '',
        token: '',
      );

      http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
    } catch (e) {
      log(e.hashCode);
    }
  }
}
