import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gonder_gelsin_application/pages/notifications/components/body.dart';
import 'package:gonder_gelsin_application/translations/locale_keys.g.dart';

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
