import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/forgot_password/components/body.dart';

class Settingspage extends StatelessWidget {
  Settingspage({super.key});
  static String routName = "/settings";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
