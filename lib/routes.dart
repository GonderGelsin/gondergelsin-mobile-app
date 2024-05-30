import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/createOrder/order_screen.dart';
import 'package:flutter_application_1/pages/forgot_password/forgot_password_screen.dart';

import 'package:flutter_application_1/pages/home/home_screen.dart';
import 'package:flutter_application_1/pages/login_succes/components/body.dart';
import 'package:flutter_application_1/pages/login_succes/login_succes_screen.dart';
import 'package:flutter_application_1/pages/notifications/notifications.dart';
import 'package:flutter_application_1/pages/order_succes/components/body.dart';
import 'package:flutter_application_1/pages/order_succes/order_succes.dart';
import 'package:flutter_application_1/pages/profile/profile_pages.dart';
import 'package:flutter_application_1/pages/settings/settings_screen.dart';
import 'package:flutter_application_1/pages/sign_in/sign_in_screen.dart';
import 'package:flutter_application_1/pages/sign_up/sign_up_screen.dart';
import 'package:flutter_application_1/pages/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccesScreen.routeName: (context) => LoginSuccesScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  HomePage.routeName: (context) => HomePage(),
  OrderScreen.routeName: (context) => OrderScreen(),
  Settingspage.routeName: (context) => Settingspage(),
  BodySucces.routeName: (context) => BodySucces(),
  BodySucces2.routeName: (context) => BodySucces2(),
  NotificationPage.routeName: (context) => NotificationPage(),
  OrderSuccesScreen.routeName: (context) => OrderSuccesScreen(),
};
