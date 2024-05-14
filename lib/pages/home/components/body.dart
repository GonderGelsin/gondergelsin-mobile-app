import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/pages/home/components/notif_screen.dart';
import 'package:flutter_application_1/pages/home/components/profile_screen.dart';
import 'package:flutter_application_1/pages/home/home_screen.dart';
import 'package:flutter_application_1/pages/settings/components/body.dart';
import 'package:flutter_application_1/pages/settings/settings_screen.dart';
import 'package:flutter_application_1/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SettingsPage(), // SettingsPage eklendi
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // BottomNavigationBar'ın seçilen öğesine göre sayfa değiştirme işlemi
    if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SettingsPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Anasayfa',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.screenWidth * 0.1,
                      ),
                    ),
                  ),
                  SizedBox(width: 80),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _navigateToNotificationPage(context);
                      },
                      child: Container(
                        width: getProportionateScreenWidth(38),
                        height: getProportionateScreenWidth(38),
                        child: Image.asset(
                          'assets/images/notification.png',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 0),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _navigateToProfilePage(context);
                      },
                      child: Container(
                        width:
                            getProportionateScreenWidth(38), // Resmin genişliği
                        height: getProportionateScreenWidth(
                            38), // Resmin yüksekliği
                        child: Image.asset(
                          'assets/images/profile.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 11), // Sağa boşluk ekleyelim
                      child: Text(
                        'Gönderiler',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.screenWidth * 0.05,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Burada kampanyalar ile ilgili bir işlem yapılabilir
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 22), // Sağa boşluk ekleyelim
                      child: Text(
                        'Kampanyalar',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.screenWidth * 0.05,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Container(
                        width: getProportionateScreenWidth(70),
                        height: getProportionateScreenWidth(70),
                        child: Image.asset(
                          'assets/images/design-1710195127425 (1)-modified (1).png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: kPrimaryColor,
          items: <BottomNavigationBarItem>[
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
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
          onTap: _onItemTapped,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // "chat" FAB'a basıldığında yapılacak işlem
          },
          child: Icon(Icons.chat), // "chat" simgesi
          backgroundColor: kPrimaryColor, // "chat" FAB'ın arka plan rengi
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  void _navigateToNotificationPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NotificationPage()),
    );
  }

  void _navigateToProfilePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePage()),
    );
  }
}
