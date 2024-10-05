import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gonder_gelsin_application/pages/createOrder/components/body.dart';
import 'package:gonder_gelsin_application/pages/home/home_screen.dart';
import 'package:gonder_gelsin_application/translations/locale_keys.g.dart';

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
