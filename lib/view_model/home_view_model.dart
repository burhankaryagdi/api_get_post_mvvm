import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/user.dart';

class HomeViewModel with ChangeNotifier {
  final String url = "https://api.escuelajs.co/api/v1/users";

  Future<List<User>?> fetchUser() async {
    Uri uri = Uri.parse(url);
    var res = await http.get(uri);
    if (res.statusCode == 200 || res.statusCode == 201) {
      List<dynamic> jsonBody = jsonDecode(res.body);
      return jsonBody.map((user) => User.fromJson(user)).toList();
    } else {
      print("Error: ${res.statusCode}");
    }
    return null;
  }
}
