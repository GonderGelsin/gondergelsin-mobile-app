import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/forgot_password/components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Şifremi Unuttum"),
      ),
      body: Body(),
    );
  }
}
