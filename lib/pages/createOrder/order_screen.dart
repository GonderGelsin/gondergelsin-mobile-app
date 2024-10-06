import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gondergelsin_mobile_app/pages/createOrder/components/body.dart';
import 'package:gondergelsin_mobile_app/pages/home/home_screen.dart';
import 'package:gondergelsin_mobile_app/translations/locale_keys.g.dart';

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
        title: Text(LocaleKeys.new_post.tr()),
      ),
      body: Body(),
    );
  }
}
