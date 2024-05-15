import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/sign_in/components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Giriş Yap"),
      ),
      body: Body(),
    );
  }
}
