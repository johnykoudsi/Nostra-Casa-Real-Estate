


import 'dart:convert';

import 'package:nostra_casa/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<UserModel?> getUserFromLocalStorage() async {
  final prefs = await SharedPreferences.getInstance();
  String? localUser = prefs.getString("user");
  if (localUser == null) {
    return null;
  }
  UserModel userFromLocal = UserModel.fromJson(json.decode(localUser));

  return userFromLocal;
}

Future saveUserToLocalStorage(UserModel user) async {
  String userString = json.encode(user.toJson());
  final prefs = await SharedPreferences.getInstance();
  prefs.setString("user", userString);
}

Future deleteUserFromLocal() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove("user");

}
