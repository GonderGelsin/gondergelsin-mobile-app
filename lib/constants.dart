import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gondergelsin_mobile_app/size_config.dart';
import 'package:gondergelsin_mobile_app/translations/locale_keys.g.dart';

const kPrimaryColor = Color(0xFF86151D + 0x0F0F0F);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Colors.black;

const kAnimationDuration = Duration(milliseconds: 200);

const headingStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final String kEmailNullError = LocaleKeys.please_enter_email.tr();
final String kInvalidEmailError = LocaleKeys.please_enter_valid_email.tr();
final String kPassNullError = LocaleKeys.please_enter_password.tr();
final String kShortPassError = LocaleKeys.password_too_short.tr();
final String kMatchPassError = LocaleKeys.passwords_do_not_match.tr();
final String kNamelNullError = LocaleKeys.please_enter_your_name.tr();
final String kPhoneNumberNullError = LocaleKeys.please_enter_phone.tr();
final String kAddressNullError = LocaleKeys.please_enter_address.tr();


final errorIcon = Icon(
  Icons.close,
  color: Colors.red,
);

Widget buildErrorWithIcon(String errorMessage) {
  return Row(
    children: [
      errorIcon,
      SizedBox(
          width: getProportionateScreenWidth(
              20)), // İkon ile hata mesajı arasında boşluk bırakmak için
      Text(
        errorMessage,
        style: TextStyle(color: Colors.red),
      ),
    ],
  );
}

final otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 16),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: kTextColor),
  );
}
