import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gonder_gelsin_application/constants.dart';
import 'package:gonder_gelsin_application/services/authentication.dart'
    as authentication;
import 'package:gonder_gelsin_application/size_config.dart';
import 'package:gonder_gelsin_application/translations/locale_keys.g.dart';
import 'package:http/http.dart' as http;

class NotificationsPage extends StatefulWidget {
  static String routeName = '/notifications';

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool _isEmailNotificationEnabled = false;
  bool _isSmsNotificationEnabled = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchNotificationSettings();
  }

  Future<void> _fetchNotificationSettings() async {
    final url =
        'https://gondergelsin.pythonanywhere.com/user/notification/preferences/';
    final authToken = await authentication.getStoredData('auth_token');
    final headers = {
      'Authorization': 'Bearer $authToken',
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _isEmailNotificationEnabled = data['email_notification'];
          _isSmsNotificationEnabled = data['sms_notification'];
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _updateNotificationSettings() async {
    final url =
        'https://gondergelsin.pythonanywhere.com/user/notification/preferences/';
    final authToken = await authentication.getStoredData('auth_token');
    final headers = {
      'Authorization': 'Bearer $authToken',
      'Content-Type': 'application/json',
    };

    final body = json.encode({
      'email_notification': _isEmailNotificationEnabled,
      'sms_notification': _isSmsNotificationEnabled,
    });

    try {
      final response =
          await http.put(Uri.parse(url), headers: headers, body: body);
      if (response.statusCode != 204) {}
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text(
          LocaleKeys.notification_settings.tr(),
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 0, 0, 0)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          LocaleKeys.receive_notifications_by_email.tr(),
                          style: TextStyle(fontSize: 16),
                        ),
                        Switch(
                          value: _isEmailNotificationEnabled,
                          onChanged: (value) {
                            setState(() {
                              _isEmailNotificationEnabled = value;
                            });
                            _updateNotificationSettings();
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 5, 5, 5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          LocaleKeys.receive_notifications_by_sms.tr(),
                          style: TextStyle(fontSize: 16),
                        ),
                        Switch(
                          value: _isSmsNotificationEnabled,
                          onChanged: (value) {
                            setState(() {
                              _isSmsNotificationEnabled = value;
                            });
                            _updateNotificationSettings();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
