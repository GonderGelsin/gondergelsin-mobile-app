import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:gondergelsin_mobile_app/components/no_account_text.dart';
import 'package:gondergelsin_mobile_app/pages/sign_in/components/social_card.dart';
import 'package:gondergelsin_mobile_app/services/authentication.dart'
    as authentication;
import 'package:gondergelsin_mobile_app/size_config.dart';
import 'package:gondergelsin_mobile_app/translations/locale_keys.g.dart';
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
    // Kullanıcıya yükleniyor durumu göstermek için
    setState(() {
      isLoading = true;
    });

    // Google kullanıcı oturumunu açma işlemi
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      // Kullanıcı oturum açma işlemini iptal etti
      setState(() {
        isLoading = false;
      });
      return;
    }

    // Google Kimlik Doğrulama Bilgilerini Al
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Firebase'de oturum aç
    final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    final User? user = userCredential.user;

    if (user != null) {
      // Kullanıcı daha önce kayıtlı mı kontrol et
      final checkResult = await authentication.checkUser(user.email);
      if (checkResult == true) {
        // Eğer kullanıcı kayıtlı ise Google Sign-In tokenını doğrula
        final tokenResult = await authentication.signInWithGoogle(googleAuth.idToken);
        if (tokenResult == true) {
          // Başarılıysa anasayfaya yönlendir
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          throw Exception('Google Sign-In sırasında bir hata oluştu');
        }
      } else {
        // Kullanıcı kayıtlı değilse kayıt tamamlama sayfasına yönlendir
        Navigator.pushReplacementNamed(
          context,
          '/complate_google_sign_up',
          arguments: {
            'email': user.email,
            'displayName': user.displayName,
          },
        );
      }
    }
  } catch (e, stackTrace) {
    // Hata olduğunda Crashlytics'e rapor gönder
    await FirebaseCrashlytics.instance.recordError(
      e,
      stackTrace,
      reason: 'Google Sign-In başarısız',
    );

    // Kullanıcıya hata mesajı göster
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Google Sign-In sırasında bir hata oluştu: ${e.toString()}'),
      ),
    );
  } finally {
    // İşlem bitince yükleniyor durumunu kapat
    setState(() {
      isLoading = false;
    });
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
