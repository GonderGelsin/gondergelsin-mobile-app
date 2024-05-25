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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
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
              SettingsItem(
                iconPath: 'assets/icons/Arturo-Wibawa-Akar-Location.512.png',
                title: 'Adreslerim',
                description: 'Buradan adreslerinizi düzenleyebilirsiniz',
                onTap: () {},
              ),
              SizedBox(height: 20),
              SettingsItem(
                iconPath: 'assets/icons/money-transfer.png',
                title: 'Ödeme Yöntemlerim',
                description: 'Ödeme yöntemlerinizi burdan yönetebilirsiniz',
                onTap: () {},
              ),
              SizedBox(height: 20),
              SettingsItem(
                iconPath: 'assets/images/notification.png',
                title: 'Bildirim Ayarları',
                description: 'Bildirim ayarlarınızı burdan yönetebilirsiniz',
                onTap: () {},
              ),
              SizedBox(height: 20),
              SettingsItem(
                iconPath: 'assets/icons/question.png',
                title: 'Yardım',
                description: 'Uygulama içi sorularınız için tıklayabilirsiniz',
                onTap: () {},
              ),
              SizedBox(height: 20),
              SettingsItem(
                iconPath: 'assets/icons/language.png',
                title: 'Language - Dil',
                description: 'Dili buradan değiştirebilirsiniz',
                onTap: () {},
              ),
              SizedBox(height: 20),
              SettingsItem(
                iconPath: 'assets/icons/Arturo-Wibawa-Akar-Sign-out.512.png',
                title: 'Çıkış Yap',
                description: '',
                onTap: () {
                  authentication.signOut(context);
                  Navigator.pushReplacementNamed(
                    context,
                    SignInScreen.routeName,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final String iconPath;
  final String title;
  final String description;
  final VoidCallback onTap;

  const SettingsItem({
    Key? key,
    required this.iconPath,
    required this.title,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              iconPath,
              height: getProportionateScreenHeight(50),
              width: getProportionateScreenWidth(50),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: SizeConfig.screenWidth * 0.07,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (description.isNotEmpty)
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: SizeConfig.screenWidth * 0.034,
                      ),
                    ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, size: 30),
          ],
        ),
      ),
    );
  }
}
