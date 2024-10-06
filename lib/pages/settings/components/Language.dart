import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gondergelsin_mobile_app/constants.dart';
import 'package:gondergelsin_mobile_app/services/authentication.dart'
    as authentication;
import 'package:http/http.dart' as http;

class LanguagePage extends StatelessWidget {
  Locale? _currentLocale;

  Future<void> _fetchUserLanguage() async {
    final url = 'https://gondergelsin.pythonanywhere.com/user/language/';
    final authToken = await authentication.getStoredData('auth_token');
    final headers = {
      'Authorization': 'Bearer $authToken',
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

  Future<void> _updateUserLanguage(
      String languageCode, BuildContext context) async {
    final url = 'https://gondergelsin.pythonanywhere.com/user/language/';
    final authToken = await authentication.getStoredData('auth_token');
    final headers = {
      'Authorization': 'Bearer $authToken',
      'Content-Type': 'application/json',
    };

    final body = json.encode({
      'app_lang': languageCode,
    });

    try {
      final response =
          await http.put(Uri.parse(url), headers: headers, body: body);
      if (response.statusCode == 204) {
        await context.setLocale(Locale("en-US"));
        await context.resetLocale();

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
            _buildLanguageButton(context, 'tr', 'Türkçe'),
            SizedBox(height: 20),
            _buildLanguageButton(context, 'en', 'English'),
          ],
        ),
      ),
    );
  }

  InkWell _buildLanguageButton(
      BuildContext context, String languageCode, String languageName) {
    return InkWell(
      onTap: () {
        _updateUserLanguage(languageCode, context);
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
            Text(languageName, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
