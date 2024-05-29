import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';

class NotificationsPage extends StatefulWidget {
  static String routeName = '/notifications';

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool _isEmailNotificationEnabled = false;
  bool _isSmsNotificationEnabled = false;

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
        title: Text(
          'Bildirim Ayarları',
          style: TextStyle(
            fontSize: 20, 
            color: Colors.black87, 
          ),
        ),
        backgroundColor: kPrimaryColor, // Theme'in primaryColor özelliğini kullanarak arka plan rengini ayarlar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
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
                    'Email ile Bildirim Almak İstiyorum',
                    style: TextStyle(fontSize: 16), 
                  ),
                  Switch(
                    value: _isEmailNotificationEnabled,
                    onChanged: (value) {
                      setState(() {
                        _isEmailNotificationEnabled = value;
                      });
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
                    'SMS ile Bildirim Almak İstiyorum',
                    style: TextStyle(fontSize: 16), 
                  ),
                  Switch(
                    value: _isSmsNotificationEnabled,
                    onChanged: (value) {
                      setState(() {
                        _isSmsNotificationEnabled = value;
                      });
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
