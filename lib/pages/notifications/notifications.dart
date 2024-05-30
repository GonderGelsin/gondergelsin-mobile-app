import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/notifications/components/body.dart';

class NotificationPage extends StatelessWidget {
  static String routeName = "/notifications";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Bildirimler'),
        ),
        body: NotificationsPage());
  }
}
