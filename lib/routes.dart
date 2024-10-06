import 'package:flutter/material.dart';
import 'package:gondergelsin_mobile_app/pages/complate_google_sign_up/complate_google_sign_up_screen.dart';
import 'package:gondergelsin_mobile_app/pages/createOrder/order_screen.dart';
import 'package:gondergelsin_mobile_app/pages/forgot_password/forgot_password_screen.dart';
import 'package:gondergelsin_mobile_app/pages/home/home_screen.dart';
import 'package:gondergelsin_mobile_app/pages/login_succes/components/body.dart';
import 'package:gondergelsin_mobile_app/pages/login_succes/login_succes_screen.dart';
import 'package:gondergelsin_mobile_app/pages/notifications/notifications.dart';
import 'package:gondergelsin_mobile_app/pages/order_succes/components/body.dart';
import 'package:gondergelsin_mobile_app/pages/order_succes/order_succes.dart';
import 'package:gondergelsin_mobile_app/pages/profile/profile_pages.dart';
import 'package:gondergelsin_mobile_app/pages/settings/components/live_support.dart';
import 'package:gondergelsin_mobile_app/pages/settings/settings_screen.dart';
import 'package:gondergelsin_mobile_app/pages/sign_in/sign_in_screen.dart';
import 'package:gondergelsin_mobile_app/pages/sign_up/sign_up_screen.dart';
import 'package:gondergelsin_mobile_app/pages/splash/splash_screen.dart';

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
  LiveSupportPage.routeName: (context) => LiveSupportPage(),
  NotificationPage.routeName: (context) => NotificationPage(),
  OrderSuccesScreen.routeName: (context) => OrderSuccesScreen(),
  ComplateGoogleSignUpScreen.routeName: (context) => ComplateGoogleSignUpScreen(),
};
