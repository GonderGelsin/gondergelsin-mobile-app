import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:gonder_gelsin_application/firebase_options.dart';
import 'package:gonder_gelsin_application/pages/splash/splash_screen.dart';
import 'package:gonder_gelsin_application/routes.dart';
import 'package:gonder_gelsin_application/services/authentication.dart';
import 'package:gonder_gelsin_application/size_config.dart';
import 'package:gonder_gelsin_application/theme.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  await EasyLocalization.ensureInitialized();
  InitFirebaseMessaging();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('tr', 'TR'), Locale('en', 'US')],
      path: 'assets/translations',
      startLocale: Locale('tr-TR'),
      useOnlyLangCode:true,
      child: MyApp(),
    ),
  );
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Message received: ${message.notification?.title}");
    });

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

void InitFirebaseMessaging() async {
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  String? token = await messaging.getToken();

  if (token != null) {
    _sendTokenToServer(token);
    print("------> token varrrrr");
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      _sendTokenToServer(newToken);
    });
  }

  print("token yooooookkk");
}

void _sendTokenToServer(String token) async {
  final authToken = await getStoredData('auth_token');
  final response = await http.post(
    Uri.parse(
        'https://gondergelsin.pythonanywhere.com/authentication/device-token/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $authToken'
    },
    body: jsonEncode(<String, String>{
      'device_token': token,
    }),
  );
  print(response.body);

  if (response.statusCode == 200) {
    print("Token successfully sent to the server");
  } else {
    print("Failed to send token to the server");
  }
}
