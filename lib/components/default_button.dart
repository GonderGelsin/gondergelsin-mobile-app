import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
    this.isLoading = false, // isLoading parametresi eklendi
  }) : super(key: key);

  final String text;
  final void Function()? press; // press parametresinin türü belirlendi
  final bool isLoading; // Yeni isLoading parametresi

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
        ),
        onPressed: isLoading ? null : press, // isLoading kontrol ediliyor
        child: isLoading
            ? CircularProgressIndicator() // isLoading true ise progress indicator göster
            : Text(
                text,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
