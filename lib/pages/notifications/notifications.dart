import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/notifications/components/body.dart';
import 'package:flutter_application_1/translations/locale_keys.g.dart';

class NotificationPage extends StatelessWidget {
  static String routeName = "/notifications";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(LocaleKeys.notifications.tr()),
        ),
        body: NotificationsPage());
  }
}
