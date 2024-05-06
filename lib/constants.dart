import 'package:flutter/material.dart';
import 'package:flutter_application_1/size_config.dart';

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
const String kEmailNullError = "Lütfen Bir E-posta Girin";
const String kInvalidEmailError = "Lütfen Geçerli Bir E-posta Adresi Girin";
const String kPassNullError = "Lütfen Bir Şifre Girin";
const String kShortPassError = " Şifre Çok Kısa";
const String kMatchPassError = "Şifreler Eşleşmiyor";
const String kNamelNullError = "Lütfen Adınızı Girin";
const String kPhoneNumberNullError = "Lütfen Telefon Numaranızı Girin";
const String kAddressNullError = "Please Enter your address";

final errorIcon = Icon(
  Icons.close,
  color: Colors.red,
);

Widget buildErrorWithIcon(String errorMessage) {
  return Row(
    children: [
      errorIcon,
      SizedBox(width: 5), // İkon ile hata mesajı arasında boşluk bırakmak için
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
