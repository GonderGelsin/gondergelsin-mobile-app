import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gonder_gelsin_application/components/default_button.dart';
import 'package:gonder_gelsin_application/pages/home/home_screen.dart';
import 'package:gonder_gelsin_application/size_config.dart';
import 'package:gonder_gelsin_application/translations/locale_keys.g.dart';

class BodySucces2 extends StatelessWidget {
  static String routeName = "/body_succes";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.1,
            ),
            Image.asset("assets/images/Adsız tasarım (2).png"),
            SizedBox(
              height: SizeConfig.screenHeight * 0.1,
            ),
            Text(
              LocaleKeys.order_created.tr(),
              style: TextStyle(
                fontSize: getProportionateScreenWidth(30),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.1,
            ),
            SizedBox(
              width: SizeConfig.screenWidth * 0.6,
              child: DefaultButton(
                text: LocaleKeys.go_to_homepage.tr(),
                press: () {
                  Navigator.pushNamed(context, HomePage.routeName);
                },
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.2,
            ),
          ],
        ),
      ),
    );
  }
}
