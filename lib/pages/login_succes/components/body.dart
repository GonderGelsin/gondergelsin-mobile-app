import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gondergelsin_mobile_app/components/default_button.dart';
import 'package:gondergelsin_mobile_app/pages/sign_in/sign_in_screen.dart';
import 'package:gondergelsin_mobile_app/size_config.dart';
import 'package:gondergelsin_mobile_app/translations/locale_keys.g.dart'; // HomePage widget'ının bulunduğu yer

class BodySucces extends StatelessWidget {
  static String routeName = "/body_succes";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.screenHeight * 0.02,
          ),
          Image.asset("assets/images/Adsız tasarım (2).png"),
          SizedBox(
            height: SizeConfig.screenHeight * 0.08,
          ),
          Text(
            LocaleKeys.registration_completed.tr(),
            style: TextStyle(
              fontSize: getProportionateScreenWidth(30),
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(
            flex: 1,
          ),
          SizedBox(
            width: SizeConfig.screenWidth * 0.6,
            child: DefaultButton(
              text: LocaleKeys.go_to_login_page.tr(),
              press: () {
                Navigator.pushNamed(context, SignInScreen.routeName);
              },
            ),
          ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
