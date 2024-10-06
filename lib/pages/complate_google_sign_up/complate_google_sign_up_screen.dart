import 'package:flutter/material.dart';
import 'package:gonder_gelsin_application/pages/complate_google_sign_up/components/complate_form.dart';


class ComplateGoogleSignUpScreen extends StatelessWidget {
  static String routeName = "/complate_google_sign_up";

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? userInfo =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Kaydını Tamamla"),
      ),
      body: CompleteProfileScreen(
        email: userInfo?['email'],
        name: userInfo?['displayName'],
      ),
    );
  }
}
