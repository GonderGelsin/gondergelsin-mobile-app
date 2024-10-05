import 'package:flutter/material.dart';
import 'package:gonder_gelsin_application/pages/forgot_password/components/body.dart';

class Settingspage extends StatelessWidget {
  Settingspage({super.key});
  static String routeName = "/settings";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
