import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/components/home_screen.dart';
import 'package:flutter_application_1/pages/welcome_page.dart';
import 'package:flutter_application_1/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: routes,
    );
  }
}
