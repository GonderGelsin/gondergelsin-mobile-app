import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/sign_up/components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Kayıt Ol"),
      ),
      body: Body(),
    );
  }
}
