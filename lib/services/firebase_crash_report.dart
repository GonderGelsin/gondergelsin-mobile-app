import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void logCustomError(String errorMessage, dynamic exception, StackTrace stackTrace) {
  FirebaseCrashlytics.instance.log(errorMessage);
  FirebaseCrashlytics.instance.recordError(exception, stackTrace, reason: errorMessage);
}

