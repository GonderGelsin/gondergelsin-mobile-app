import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/default_button.dart';
import 'package:flutter_application_1/pages/home/home_screen.dart';
import 'package:flutter_application_1/size_config.dart';

class BodySucces2 extends StatelessWidget {
  static String routeName = "/body_succes";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            "Siparişiniz Oluşturuldu!",
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
                Navigator.pushNamed(context, HomePage.routeName);
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
