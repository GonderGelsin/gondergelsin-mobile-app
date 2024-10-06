import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gondergelsin_mobile_app/pages/sign_up/components/body.dart';
import 'package:gondergelsin_mobile_app/translations/locale_keys.g.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(LocaleKeys.register.tr()),
      ),
      body: Body(),
    );
  }
}
