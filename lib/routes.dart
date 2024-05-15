import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/forgot_password/forgot_password_screen.dart';
import 'package:flutter_application_1/pages/home/components/body.dart';
import 'package:flutter_application_1/pages/home/home_screen.dart';
import 'package:flutter_application_1/pages/login_succes/components/body.dart';
import 'package:flutter_application_1/pages/login_succes/login_succes_screen.dart';
import 'package:flutter_application_1/pages/profile/profile_pages.dart';
import 'package:flutter_application_1/pages/sign_in/sign_in_screen.dart';
import 'package:flutter_application_1/pages/sign_up/sign_up_screen.dart';
import 'package:flutter_application_1/pages/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  ProfileScreen.routeName: (context) =>  ProfileScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccesScreen.routeName: (context) => LoginSuccesScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  HomePage.routeName: (context) => HomePage(),
  BodySucces.routeName: (contest) => Body(),
};
