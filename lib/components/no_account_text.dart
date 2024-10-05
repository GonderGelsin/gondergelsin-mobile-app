import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gonder_gelsin_application/constants.dart';
import 'package:gonder_gelsin_application/pages/sign_up/sign_up_screen.dart';
import 'package:gonder_gelsin_application/size_config.dart';
import 'package:gonder_gelsin_application/translations/locale_keys.g.dart';

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
          LocaleKeys.no_account.tr(),
          style: TextStyle(
              fontSize: getProportionateScreenWidth(16), fontFamily: "Mali"),
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
          child: Text(
            LocaleKeys.register.tr(),
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
