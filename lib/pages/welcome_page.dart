import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/pages/register_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE64A19),
              Color(0xFFD50000),
            ],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Image(
                image: AssetImage('assets/images/Logogelsin2.png'),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Gönder Gelsin′e',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            Text(
              'Hoşgeldiniz',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    'Giriş Yap',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    'Kayıt Ol',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
