import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class SignUpViewModel with ChangeNotifier {
  TextEditingController avatarController = TextEditingController(
    text: "https://picsum.photos/800",
  );
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signUp(BuildContext context) async {
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
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Kayıt başarılı: ${emailController.text}")),
        );
      }
      log("Sign Up Success");
      log(res.statusCode.toString());
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Kayıt başarısız")));
        log("Sign Up Failed");
        log(res.statusCode.toString());
      }
    }
  }
}
