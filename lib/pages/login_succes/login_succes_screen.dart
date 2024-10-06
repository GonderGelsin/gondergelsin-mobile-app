import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gondergelsin_mobile_app/pages/login_succes/components/body.dart';
import 'package:gondergelsin_mobile_app/size_config.dart';
import 'package:gondergelsin_mobile_app/translations/locale_keys.g.dart';

class LoginSuccesScreen extends StatelessWidget {
  static String routeName = "/login_succes";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          LocaleKeys.registration_completed.tr(),
          style: TextStyle(
            color: Colors.black54,
            fontSize: getProportionateScreenWidth(16),
          ),
        ), //
      ),
      body: BodySucces(),
    );
  }
}
