import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/home_screen.dart';
import 'package:flutter_application_1/pages/settings/components/Language.dart';
import 'package:flutter_application_1/pages/settings/components/help.dart';
import 'package:flutter_application_1/pages/settings/components/live_support.dart';
import 'package:flutter_application_1/pages/settings/components/notifications_page.dart';
import 'package:flutter_application_1/pages/settings/components/payment_page.dart';
import 'package:flutter_application_1/pages/sign_in/sign_in_screen.dart';
import 'package:flutter_application_1/services/authentication.dart'
    as authentication;
import 'package:flutter_application_1/size_config.dart';
import 'package:flutter_application_1/translations/locale_keys.g.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(LocaleKeys.settings.tr()),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  textAlign: TextAlign.center,
                  LocaleKeys.settings.tr(),
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(30),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              SettingsItem(
                iconPath: 'assets/icons/Arturo-Wibawa-Akar-Reciept.512.png',
                title: LocaleKeys.live_support.tr(),
                description: LocaleKeys.contact_live_support.tr(),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LiveSupportPage(),
                      ));
                },
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              SettingsItem(
                iconPath: 'assets/icons/money-transfer.png',
                title: LocaleKeys.payment_methods.tr(),
                description: LocaleKeys.manage_payment_methods.tr(),
                onTap: () {
                  Navigator.push(
                    context,
                  MaterialPageRoute(builder: (context) => PaymentPage()),
                  );
                },

              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              SettingsItem(
                iconPath: 'assets/images/notification.png',
                title: LocaleKeys.notification_settings.tr(),
                description: LocaleKeys.manage_notification_settings.tr(),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationsPage()),
                  );
                },
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              SettingsItem(
                iconPath: 'assets/icons/question.png',
                title: LocaleKeys.help.tr(),
                description: LocaleKeys.click_for_app_questions.tr(),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HelpPage()),
                  );
                },
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              SettingsItem(
                iconPath: 'assets/icons/language.png',
                title: 'Language - Dil',
                description: LocaleKeys.change_language.tr(),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LanguagePage()),
                  );
                },
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              SettingsItem(
                iconPath: 'assets/icons/Arturo-Wibawa-Akar-Sign-out.512.png',
                title: LocaleKeys.logout.tr(),
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
              height: getProportionateScreenHeight(30),
            ),
            SizedBox(
              width: getProportionateScreenWidth(20),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(20),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (description.isNotEmpty)
                    Text(
                      description,
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(12),
                          fontWeight: FontWeight.w400),
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
