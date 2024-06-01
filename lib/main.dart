import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/pages/splash/splash_screen.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:flutter_application_1/size_config.dart';
import 'package:flutter_application_1/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('tr', 'TR'), Locale('en', 'US')],
        path: 'assets/translations',
        fallbackLocale: Locale('tr', 'TR'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      routes: routes,
      initialRoute: SplashScreen.routeName,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: theme(),
    );
  }
}
