import 'package:api_get_post_mvvm/view_model/home_view_model.dart';
import 'package:api_get_post_mvvm/view_model/login_view_model.dart';
import 'package:api_get_post_mvvm/view_model/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view/login_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
        ChangeNotifierProvider(create: (context) => SignUpViewModel()),
      ],
      child: MaterialApp(home: LoginView(), debugShowCheckedModeBanner: false),
    );
  }
}

/* 
kullanılmayan anlamsız modeller olmayacak. 

giriş yapıldığında veya kayıt yapıldıgında 
tokeni kaydet shared preferences ile karşılama ekranı karşılasın giriş yapılmışssa veya 
 daha önceden kayıt yapılmışsa direkt home sayfasına yönlendirsin

signupta kullanıcı kayıt olduktan sonra giriş sayfasına yönlendirsin 

ROUTER yapısı öğrenilip kullanılacak.
*/
