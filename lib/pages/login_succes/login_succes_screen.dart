import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/pages/login_succes/components/body.dart';

class LoginSuccesScreen extends StatelessWidget {
  static String routName = "/login_succes";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text(
          "Giriş Tamamlandı",
          style: TextStyle(
            color: Colors.black54, // Başlık rengi
            fontSize: 20, // Başlık font boyutu
          ),
        ),
        centerTitle: true, // Başlığı ortalamak için
      ),
      body: BodySucces(),
    );
  }
}
