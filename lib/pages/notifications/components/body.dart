import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/authentication.dart'
    as authentication;
import 'package:flutter_application_1/size_config.dart';
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
        notifications =
            json.decode(utf8.decode(response.bodyBytes)).reversed.toList();
      });
    } else {
      throw Exception('Failed to load notifications');
    }
  }

  markAsRead(int id) async {
    const url =
        "https://gondergelsin.pythonanywhere.com/user/notification/read/";
    final authToken = await authentication.getStoredData('auth_token');

    http.Response response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': 'Token $authToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'id': id}),
    );

    if (response.statusCode == 200) {
      setState(() {
        notifications = notifications.map((notification) {
          if (notification['id'] == id) {
            notification['is_read'] = true;
          }
          return notification;
        }).toList();
      });
    } else {
      throw Exception('Failed to mark notification as read');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: notifications.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                padding: EdgeInsets.all(10.0),
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return NotificationItem(
                    id: notifications[index]['id'],
                    title: notifications[index]['title'],
                    description: notifications[index]['message'],
                    isRead: notifications[index]['is_read'],
                    onRead: () => markAsRead(notifications[index]['id']),
                  );
                },
              ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final int id;
  final String title;
  final String description;
  final bool isRead;
  final VoidCallback onRead;

  const NotificationItem({
    Key? key,
    required this.id,
    required this.title,
    required this.description,
    required this.isRead,
    required this.onRead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onRead,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(Icons.notification_important,
                size: getProportionateScreenHeight(30), color: Colors.blue),
            SizedBox(width: getProportionateScreenWidth(20)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(20),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (description.isNotEmpty)
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(12),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                ],
              ),
            ),
            if (!isRead)
              GestureDetector(
                onTap: onRead,
                child: Icon(Icons.circle,
                    size: getProportionateScreenHeight(16), color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
