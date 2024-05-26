import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/pages/createOrder/order_screen.dart';
import 'package:flutter_application_1/pages/home/components/notif_screen.dart';
import 'package:flutter_application_1/pages/home/home_screen.dart';
import 'package:flutter_application_1/pages/profile/profile_pages.dart';
import 'package:flutter_application_1/pages/settings/components/body.dart';
import 'package:flutter_application_1/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    OrderScreen(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _selectedIndex == 0
            ? SingleChildScrollView(
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
                              width: getProportionateScreenWidth(38),
                              height: getProportionateScreenWidth(38),
                              child: Image.asset(
                                'assets/images/profile.png',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(left: 11),
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
                            // Kampanyalar ile ilgili işlem
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 22),
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
              )
            : _widgetOptions[_selectedIndex],
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: kPrimaryColor,
          height: SizeConfig.screenWidth * 0.17,
          items: [
            TabItem(icon: Icons.home, title: 'Anasayfa'),
            TabItem(icon: Icons.add, title: 'Sipariş Oluştur'),
            TabItem(icon: Icons.settings, title: 'Ayarlar'),
          ],
          initialActiveIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // "chat" FAB'a basıldığında yapılacak işlem
          },
          child: Icon(Icons.chat),
          backgroundColor: kPrimaryColor,
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
      MaterialPageRoute(builder: (context) => ProfileScreen()),
    );
  }
}
