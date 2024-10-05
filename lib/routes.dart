import 'package:flutter/material.dart';
import 'package:gonder_gelsin_application/pages/createOrder/order_screen.dart';
import 'package:gonder_gelsin_application/pages/forgot_password/forgot_password_screen.dart';

import 'package:gonder_gelsin_application/pages/home/home_screen.dart';
import 'package:gonder_gelsin_application/pages/login_succes/components/body.dart';
import 'package:gonder_gelsin_application/pages/login_succes/login_succes_screen.dart';
import 'package:gonder_gelsin_application/pages/notifications/notifications.dart';
import 'package:gonder_gelsin_application/pages/order_succes/components/body.dart';
import 'package:gonder_gelsin_application/pages/order_succes/order_succes.dart';
import 'package:gonder_gelsin_application/pages/profile/profile_pages.dart';
import 'package:gonder_gelsin_application/pages/settings/settings_screen.dart';
import 'package:gonder_gelsin_application/pages/sign_in/sign_in_screen.dart';
import 'package:gonder_gelsin_application/pages/sign_up/sign_up_screen.dart';
import 'package:gonder_gelsin_application/pages/splash/splash_screen.dart';
import 'package:gonder_gelsin_application/pages/settings/components/live_support.dart';

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
};
