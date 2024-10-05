import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/no_account_text.dart';
import 'package:flutter_application_1/pages/login_succes/login_succes_screen.dart';
import 'package:flutter_application_1/pages/sign_in/components/social_card.dart';
import 'package:flutter_application_1/services/authentication.dart'
    as authentication;
import 'package:flutter_application_1/size_config.dart';
import 'package:flutter_application_1/translations/locale_keys.g.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'sign_form.dart';

class Body extends StatefulWidget {
  const Body({Key? key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    checkToken();
  }

  Future<void> checkToken() async {
    final token = await authentication.getStoredData('auth_token');
    if (token != '') {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _handleGoogleSignIn() async {
    try {
      setState(() {
        isLoading = true;
      });

      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        // The user canceled the sign-in
        setState(() {
          isLoading = false;
        });
        return;
      }

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      FirebaseCrashlytics.instance
          .log('Kullanıcı Google ile başarılı şekilde giriş yaptı.');

      Navigator.pushReplacementNamed(
        context,
        LoginSuccesScreen.routeName,
      ).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(LocaleKeys.register_successful.tr()),
          ),
        );
      });
    } catch (e, stackTrace) {
      await FirebaseCrashlytics.instance
          .recordError(e, stackTrace, reason: 'Google Sign-In başarısız');

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(LocaleKeys.registration_error_occurred.tr()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  LocaleKeys.welcome.tr(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  LocaleKeys.login_with_email_and_password_or_social.tr(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                isLoading ? CircularProgressIndicator() : SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      icon: "assets/images/search.png",
                      press: _handleGoogleSignIn,
                    ),
                    SocialCard(
                      icon: "assets/images/facebook.png",
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                NoAccountText()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
