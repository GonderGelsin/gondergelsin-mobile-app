import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/components/body.dart';
import 'package:flutter_application_1/size_config.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
