import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gondergelsin_mobile_app/pages/forgot_password/components/body.dart';
import 'package:gondergelsin_mobile_app/translations/locale_keys.g.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(LocaleKeys.forgot_password.tr()),
      ),
      body: Body(),
    );
  }
}
