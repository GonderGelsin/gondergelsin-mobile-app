import 'package:flutter/material.dart';
import 'package:gondergelsin_mobile_app/pages/home/components/body.dart';

class HomePage extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
