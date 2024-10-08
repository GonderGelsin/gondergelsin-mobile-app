import 'package:flutter/material.dart';
import 'package:gondergelsin_mobile_app/pages/splash/components/body.dart';
import 'package:gondergelsin_mobile_app/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
