import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gondergelsin_mobile_app/pages/order_succes/components/body.dart';

class OrderSuccesScreen extends StatelessWidget {
  static String routeName = "/order_succes";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodySucces2(),
    );
  }
}
