// lib/pages/notifications/notifications.dart

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/authentication.dart'
    as authentication;
import 'package:http/http.dart' as http;

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List notifications = [];

  @override
  void initState() {
    super.initState();
    fetchNotifications();
  }

  fetchNotifications() async {
    const url = "https://gondergelsin.pythonanywhere.com/user/notification/";
    final authToken = await authentication.getStoredData('auth_token');

    http.Response response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Token $authToken'},
    );

    if (response.statusCode == 200) {
      setState(() {
        notifications = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load notifications');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: notifications.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(notifications[index]['title']),
                  subtitle: Text(notifications[index]['message']),
                );
              },
            ),
    );
  }
}
