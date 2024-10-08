import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart'; // Add this import
import 'package:gondergelsin_mobile_app/firebase_options.dart';
import 'package:gondergelsin_mobile_app/pages/splash/splash_screen.dart';
import 'package:gondergelsin_mobile_app/routes.dart';
import 'package:gondergelsin_mobile_app/services/authentication.dart';
import 'package:gondergelsin_mobile_app/size_config.dart';
import 'package:gondergelsin_mobile_app/theme.dart';
import 'package:http/http.dart' as http;

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin(); // Add this initialization

void main() async {
  print(DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize Firebase Messaging
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  await EasyLocalization.ensureInitialized();

  // Setup notification channel
  setupNotificationChannel();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('tr', 'TR'), Locale('en', 'US')],
      path: 'assets/translations',
      startLocale: Locale('tr-TR'),
      useOnlyLangCode: true,
      child: MyApp(),
    ),
  );
}

// Function to handle background messages
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print("Handling a background message: ${message.messageId}");
}

// Setup notification channel for Android 8.0+ devices
void setupNotificationChannel() async {
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'default_channel_id',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
  );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
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

Future<void> InitFirebaseMessaging() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  String? token = await messaging.getToken();

  if (token != null) {
    _sendTokenToServer(token);
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      _sendTokenToServer(newToken);
    });
  }
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
