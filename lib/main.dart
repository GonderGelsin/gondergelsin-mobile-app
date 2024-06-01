import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/splash/splash_screen.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:flutter_application_1/size_config.dart';
import 'package:flutter_application_1/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('tr', 'TR')],
        path: 'assets/translations',
        fallbackLocale: Locale('en', 'US'),
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
