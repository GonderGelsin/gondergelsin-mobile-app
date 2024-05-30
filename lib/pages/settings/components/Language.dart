import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';

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
            InkWell(
              onTap: () {
                _changeLanguage('tr', context);
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
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                _changeLanguage('en', context);
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
            ),
          ],
        ),
      ),
    );
  }

  void _changeLanguage(String languageCode, BuildContext context) {
    if (languageCode == 'tr') {
      _currentLocale = Locale('tr', 'TR');
    } else if (languageCode == 'en') {
      // İngilizce butonuna tıklanıldığında yapılacak işlemler buraya eklenebilir
    }
  }
}
