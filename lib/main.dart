import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/pages/home/home_screen.dart';
import 'package:flutter_application_1/pages/splash/splash_screen.dart';
// import 'package:flutter_application_1/pages/welcome_page.dart';

import 'package:flutter_application_1/routes.dart';
import 'package:flutter_application_1/size_config.dart';

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

      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blueGrey,
        fontFamily: "Mali",
        textTheme: TextTheme(
          bodyLarge: TextStyle(
              color: kTextColor,
              fontSize:
                  16.0), // Örnek olarak font büyüklüğünü 16 olarak ayarladım
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: SplashScreen(),
      initialRoute: SplashScreen.routeName,

      routes: routes,
    );
  }
}
