import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginViewModel with ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  Future<String?> login() async {
    _setLoading(true);
    _setError(null);

    final url = Uri.parse("https://api.escuelajs.co/api/v1/auth/login");

    try {
      final res = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": emailController.text.trim(),
          "password": passwordController.text.trim(),
        }),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        final jsonBody = jsonDecode(res.body);
        return jsonBody["access_token"];
      } else {
        _setError("Giriş başarısız. Hata kodu: ${res.statusCode}");
      }
    } catch (e) {
      _setError("Bir hata oluştu: $e");
    } finally {
      _setLoading(false);
    }

    return null;
  }
}
