import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../model/sign_up_model.dart';

class SignUpViewModel with ChangeNotifier {
  TextEditingController avatarController = TextEditingController(
    text: "https://picsum.photos/800",
  );
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<SignUpModel?> signUp() async {
    var url = Uri.parse("https://api.escuelajs.co/api/v1/users/");

    var res = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "avatar": avatarController.text,
        "name": nameController.text,
        "email": emailController.text,
        "password": passwordController.text,
      }),
    );
    if (res.statusCode == 201) {
      print("Sign Up Success");
      print(res.statusCode);

      final json = jsonDecode(res.body);
      return SignUpModel.fromJson(json);
    } else {
      print("Sign Up Failed");
      print(res.statusCode);

      return null;
    }
  }
}
