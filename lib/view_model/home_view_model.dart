import 'dart:convert';

import 'package:api_get_post_mvvm/model/home_model.dart';
import 'package:http/http.dart' as http;

class HomeViewModel {
  final String url = "https://api.escuelajs.co/api/v1/users";

  Future<List<HomeModel>?> fetchUser() async {
    Uri uri = Uri.parse(url);
    var res = await http.get(uri);
    if (res.statusCode == 200 || res.statusCode == 201) {
      List<dynamic> jsonBody = jsonDecode(res.body);
      return jsonBody.map((user) => HomeModel.fromJson(user)).toList();
    } else {
      print("Error: ${res.statusCode}");
    }
    return null;
  }
}
