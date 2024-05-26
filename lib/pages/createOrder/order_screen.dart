import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/createOrder/components/body.dart';
import 'package:flutter_application_1/pages/home/home_screen.dart';

class OrderScreen extends StatelessWidget {
  static String routeName = "/order";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(
              context,
              HomePage.routeName,
            );
          },
          child: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: Text("Yeni Gönderi"),
      ),
      body: Body(),
    );
  }
}
