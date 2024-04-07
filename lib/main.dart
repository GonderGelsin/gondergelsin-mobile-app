import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/Pages/Welcome_page.dart';
import 'package:flutter_application_1/components/login_page.dart'; // login_page.dart dosyası components klasöründe

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
