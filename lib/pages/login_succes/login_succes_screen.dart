import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/pages/login_succes/components/body.dart';
import 'package:flutter_application_1/size_config.dart';

class LoginSuccesScreen extends StatelessWidget {
  static String routeName = "/login_succes";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Kayıt Tamamlandı",
          style: TextStyle(
            color: Colors.black54,
            fontSize: getProportionateScreenWidth(16),
          ),
        ), //
      ),
      body: BodySucces(),
    );
  }
}
