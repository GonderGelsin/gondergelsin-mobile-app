import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/components/home_screen.dart';
import 'package:flutter_application_1/pages/login_succes/components/body.dart';
import 'package:flutter_application_1/pages/login_succes/login_succes_screen.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/home/components/body.dart';
import 'package:flutter_application_1/pages/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginPage.routeName: (context) => LoginPage(),
  LoginSuccesScreen.routName: (context) => LoginSuccesScreen(),
  HomePage.routName: (context) => HomePage(),
  BodySucces.routName: (contest) => Body(),
};
