import 'package:flutter/material.dart';
import 'package:gondergelsin_mobile_app/size_config.dart';

class CustomSurffixIcon extends StatelessWidget {
  const CustomSurffixIcon({
    Key? key,
    required this.pngIcon,
  }) : super(key: key);

  final String pngIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, getProportionateScreenWidth(20),
          getProportionateScreenWidth(20), getProportionateScreenWidth(20)),
      child: Image.asset(
        pngIcon,
        height: getProportionateScreenHeight(18),
      ),
    );
  }
}
