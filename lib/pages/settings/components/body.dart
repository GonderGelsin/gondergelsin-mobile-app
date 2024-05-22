import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/pages/home/home_screen.dart';
import 'package:flutter_application_1/pages/sign_in/sign_in_screen.dart';
import 'package:flutter_application_1/services/authentication.dart'
    as authentication;
import 'package:flutter_application_1/size_config.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(
              context,
              HomePage.routeName,
            );
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Ayarlar",
              style: TextStyle(
                fontSize: SizeConfig.screenWidth * 0.12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/Arturo-Wibawa-Akar-Person.512.png',
                  height: getProportionateScreenHeight(50),
                  width: getProportionateScreenWidth(45),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hesap Ayarları",
                      style: TextStyle(
                          fontSize: SizeConfig.screenWidth * 0.07,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(),
                    Text(
                      'Buradan hesap ayarlarınızı yönetebilirsiniz',
                      style:
                          TextStyle(fontSize: SizeConfig.screenWidth * 0.034),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    'assets/icons/Arturo-Wibawa-Akar-Chevron-right-small.512.png',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Container(
            width: double.infinity,
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/money-transfer.png',
                  height: getProportionateScreenHeight(50),
                  width: getProportionateScreenWidth(50),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ödeme Yöntemlerim",
                      style: TextStyle(
                          fontSize: SizeConfig.screenWidth * 0.07,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(),
                    Text(
                      'Ödeme yöntemlerinizi burdan yönetebilirsiniz',
                      style:
                          TextStyle(fontSize: SizeConfig.screenWidth * 0.034),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    'assets/icons/Arturo-Wibawa-Akar-Chevron-right-small.512.png',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Container(
            width: double.infinity,
            child: Row(
              children: [
                Image.asset(
                  'assets/images/notification.png',
                  height: getProportionateScreenHeight(50),
                  width: getProportionateScreenWidth(43),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bildirim Ayarları",
                      style: TextStyle(
                          fontSize: SizeConfig.screenWidth * 0.07,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(),
                    Text(
                      'Bildirim ayarlarınızı burdan yönetebilirsiniz',
                      style:
                          TextStyle(fontSize: SizeConfig.screenWidth * 0.034),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    'assets/icons/Arturo-Wibawa-Akar-Chevron-right-small.512.png',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Container(
            width: double.infinity,
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/question.png',
                  height: getProportionateScreenHeight(46),
                  width: getProportionateScreenWidth(45),
                ),
                const SizedBox(
                  width: 19,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Yardım",
                      style: TextStyle(
                          fontSize: SizeConfig.screenWidth * 0.07,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(),
                    Text(
                      'Uygulama içi sorularınız için tıklayabilirsiniz',
                      style:
                          TextStyle(fontSize: SizeConfig.screenWidth * 0.034),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    'assets/icons/Arturo-Wibawa-Akar-Chevron-right-small.512.png',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Container(
            width: double.infinity,
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/language.png',
                  height: getProportionateScreenHeight(60),
                  width: getProportionateScreenWidth(50),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Language - Dil",
                      style: TextStyle(
                          fontSize: SizeConfig.screenWidth * 0.07,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(),
                    Text(
                      'Dili buradan değiştirebilirsiniz',
                      style:
                          TextStyle(fontSize: SizeConfig.screenWidth * 0.034),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    'assets/icons/Arturo-Wibawa-Akar-Chevron-right-small.512.png',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Container(
            width: double.infinity,
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/Arturo-Wibawa-Akar-Sign-out.512.png',
                  height: getProportionateScreenHeight(50),
                  width: getProportionateScreenWidth(50),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        authentication.signOut(context);
                        Navigator.pushReplacementNamed(
                          context,
                          SignInScreen.routeName,
                        );
                      },
                      child: Text(
                        "Çıkış Yap",
                        style: TextStyle(
                            fontSize: SizeConfig.screenWidth * 0.07,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                Spacer(),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    'assets/icons/Arturo-Wibawa-Akar-Chevron-right-small.512.png',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
