import 'package:api_get_post_mvvm/view/login_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginView(), debugShowCheckedModeBanner: false);
  }
}
