import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/components/body.dart';

class HomePage extends StatelessWidget {
  static String routName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
