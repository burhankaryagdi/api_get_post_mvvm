import 'package:flutter/material.dart';

import '../view/login_view.dart';

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
soru : her sayfada kullanmak isteyeceğim bir widget yazmak istersem bunu
 hangi dosyada konumlandırmam gerekiyor veya widgets adlı bir klasör açmalı mıyım ?


isimlendirme dartlar en üstte package ortada şahsi dosyalar en altta(noktalı şekilde import)

fromJson = jsondan gelen veriyi modele dönüştürür. (dan-den / jsondan geliyor)
toJson = elimizdeki modeli jsona dönüştürür (a-e / json'a gönder)
jsonEncode = elimizdeki dart objesini jsona dönüştürür
jsonDecode = gelen json verisini dart objesine dönüştürür ( veriyi çözümle decode et )

 */
