import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/splash/splash_screen.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:flutter_application_1/size_config.dart';
import 'package:flutter_application_1/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      // home: SplashScreen(),
      initialRoute: SplashScreen.routeName,

      routes: routes,
    );
  }
}
