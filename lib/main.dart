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

/* 

isimlendirme dartlar en üstte package ortada şahsi dosyalar en altta(noktalı şekilde import)

fromJson = jsondan gelen veriyi modele dönüştürür. (dan-den / jsondan geliyor)
toJson = elimizdeki modeli jsona dönüştürür (a-e / json'a gönder)
jsonEncode = elimizdeki dart objesini jsona dönüştürür
jsonDecode = gelen json verisini dart objesine dönüştürür ( veriyi çözümle decode et )

 */
