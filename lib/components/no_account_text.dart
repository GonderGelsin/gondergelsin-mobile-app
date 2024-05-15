import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/pages/sign_up/sign_up_screen.dart';
import 'package:flutter_application_1/size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Hesabınız Yok Mu?",
          style: TextStyle(
              fontSize: getProportionateScreenWidth(16), fontFamily: "Mali"),
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
          child: Text(
            "Kayıt Ol",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor,
                fontFamily: "Mali"),
          ),
        ),
      ],
    );
  }
}
