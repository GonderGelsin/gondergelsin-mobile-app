import 'package:flutter/material.dart';
import 'package:gondergelsin_mobile_app/constants.dart';
import 'package:gondergelsin_mobile_app/size_config.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
  }) : super(key: key);
  final String text, icon;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Color(0xFFF5F6F9),
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onPressed: press,
        child: Row(
          children: [
            Image.asset(
              icon,
              width: getProportionateScreenWidth(10),
              color: kPrimaryColor,
            ),
            SizedBox(width: getProportionateScreenWidth(10)),
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
