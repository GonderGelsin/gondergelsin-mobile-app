import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/services/authentication.dart'
    as authentication;
import 'package:http/http.dart' as http;

void main() {
  runApp(Language_dil());
}

class Language_dil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LanguagePage(),
    );
  }
}

class LanguagePage extends StatelessWidget {
  Locale? _currentLocale;

  Future<void> _fetchUserLanguage() async {
    final url = 'https://gondergelsin.pythonanywhere.com/user/language/';
    final authToken = await authentication.getStoredData('auth_token');
    final headers = {
      'Authorization': 'Token $authToken',
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _currentLocale = Locale(data['app_lang']);
      } else {
        // Handle error
      }
    } catch (error) {
      // Handle error
    }
  }

  Future<void> _updateUserLanguage(String languageCode) async {
    final url = 'https://gondergelsin.pythonanywhere.com/user/language/';
    final authToken = await authentication.getStoredData('auth_token');
    final headers = {
      'Authorization': 'Token $authToken',
      'Content-Type': 'application/json',
    };

    final body = json.encode({
      'app_lang': languageCode,
    });

    try {
      final response =
          await http.put(Uri.parse(url), headers: headers, body: body);
      if (response.statusCode == 204) {
      } else {
        // Handle error
      }
    } catch (error) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Language-Dil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BuildTRButton(),
            SizedBox(height: 20),
            BuildENButton(),
          ],
        ),
      ),
    );
  }

  InkWell BuildENButton() {
    return InkWell(
      onTap: () {
        _updateUserLanguage('en');
      },
      child: Container(
        width: 200,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.language, color: kPrimaryColor),
            SizedBox(width: 10),
            Text('English', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }

  InkWell BuildTRButton() {
    return InkWell(
      onTap: () {
        _updateUserLanguage("tr");
      },
      child: Container(
        width: 200,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.language, color: kPrimaryColor),
            SizedBox(width: 10),
            Text('Türkçe', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
