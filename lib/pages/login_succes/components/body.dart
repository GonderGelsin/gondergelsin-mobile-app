import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/components/default_button.dart';
import 'package:flutter_application_1/pages/home/home_screen.dart';
import 'package:flutter_application_1/size_config.dart'; // HomePage widget'ının bulunduğu yer

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
            "Giriş Tamamlandı",
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
              text: "Ana Sayfaya Dön",
              press: () {
                Navigator.pushNamed(context, HomePage.routName);
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
