import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/user.dart';

class HomeViewModel with ChangeNotifier {
  final String url = "https://api.escuelajs.co/api/v1/users";

  List<User> _users = [];
  List<User> get users => _users;

  Future<void> fetchUser() async {
    Uri uri = Uri.parse(url);
    var res = await http.get(uri);
    if (res.statusCode == 200 || res.statusCode == 201) {
      List<dynamic> jsonBody = jsonDecode(res.body);
      _users = jsonBody.map((e) => User.fromJson(e)).toList();
      notifyListeners();
    } else {
      print("Error: ${res.statusCode}");
    }
  }
}
