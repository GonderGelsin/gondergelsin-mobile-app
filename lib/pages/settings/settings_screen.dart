import 'package:flutter/material.dart';
import 'package:gondergelsin_mobile_app/pages/forgot_password/components/body.dart';

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
