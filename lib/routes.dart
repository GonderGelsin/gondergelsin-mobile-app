import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/components/home_screen.dart';
import 'package:flutter_application_1/pages/login_succes/login_succes_screen.dart';
import 'package:flutter_application_1/pages/login_page.dart';

final Map<String, WidgetBuilder> routes = {
  LoginPage.routeName: (context) => LoginPage(),
  LoginSuccesScreen.routName: (context) => LoginSuccesScreen(),
  HomePage.routName: (context) => HomePage()
};
