import 'package:flutter/material.dart';
import 'package:gonder_gelsin_application/pages/home/components/body.dart';

class HomePage extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
