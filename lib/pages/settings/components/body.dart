import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/size_config.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                    Text(
                      "Çıkış Yap",
                      style: TextStyle(
                          fontSize: SizeConfig.screenWidth * 0.07,
                          fontWeight: FontWeight.bold),
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
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kPrimaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Anasayfa',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/Arturo-Wibawa-Akar-Plus.512.png',
              width: 24, // Genişlik
              height: 24, // Yükseklik
            ),
            label: '', // Boş label
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Ayarlar',
          ),
        ],
        currentIndex:
            1, // Ayarlar sayfasında olduğumuzu belirtmek için index'i 1 yapın
        onTap: (index) {
          if (index == 0) {
            // Anasayfaya git
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
