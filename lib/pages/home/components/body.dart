import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/pages/createOrder/order_screen.dart';
import 'package:flutter_application_1/pages/home/home_screen.dart';
import 'package:flutter_application_1/pages/notifications/notifications.dart';
import 'package:flutter_application_1/pages/profile/profile_pages.dart';
import 'package:flutter_application_1/pages/settings/components/body.dart';
import 'package:flutter_application_1/pages/settings/components/live_support.dart';
import 'package:flutter_application_1/size_config.dart';
import 'package:flutter_application_1/translations/locale_keys.g.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _selectedIndex = 0;
  String _selectedText = LocaleKeys.posts.tr();
  double _containerWidth = getProportionateScreenWidth(120);
  double _containerHeight = getProportionateScreenHeight(120);

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

  List imageList = [
    "assets/images/vecteezy_gift-with-golden-ribbon.jpg",
    "assets/images/vecteezy_isometric-style-deliver.jpg",
    "assets/images/vecteezy_mobile-smart-phone-with.jpg",
  ];

  List textTitle = [
    "Detaylı Bilgi İçin Tıklayınız",
    "Detaylı Bilgi İçin Tıklayınız",
    "Detaylı Bilgi İçin Tıklayınız",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _selectedIndex == 0
            ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: getProportionateScreenHeight(10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            LocaleKeys.homepage.tr(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: getProportionateScreenWidth(30),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(120),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _navigateToNotificationPage(context);
                            },
                            child: Container(
                              height: getProportionateScreenWidth(35),
                              child: Image.asset(
                                'assets/images/notification.png',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _navigateToProfilePage(context);
                            },
                            child: Container(
                              height: getProportionateScreenWidth(35),
                              child: Image.asset(
                                'assets/images/profile.png',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),

                    SizedBox(height: getProportionateScreenHeight(20)),

                    //Animated Containers
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _containerWidth = _containerWidth == 400.0
                                  ? getProportionateScreenWidth(120)
                                  : 400.0;
                            });
                          },
                          child: AnimatedContainer(
                            margin: EdgeInsets.only(left: 10, bottom: 10),
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: _containerWidth,
                            height: _containerHeight,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                            alignment: Alignment.centerLeft,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: getProportionateScreenWidth(100),
                                  child: Image.asset(
                                    'assets/images/vecteezy_3d-delivery-man-character-deivering-package-with-a-scooter_36876803 (2).png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Visibility(
                                  visible: _containerWidth == 400.0,
                                  child: Expanded(
                                    child: SingleChildScrollView(
                                      // SingleChildScrollView ekleyin
                                      scrollDirection: Axis
                                          .horizontal, // Dikey yönde kaydırma
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              height:
                                                  getProportionateScreenHeight(
                                                      10)),
                                          Text(
                                            LocaleKeys.motor.tr(),
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            'Çabucak ve güvenilir teslimatlar \niçin moto kurye hazır! ',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            '0-20 kg',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _containerWidth = _containerWidth == 400.0
                                  ? getProportionateScreenWidth(100)
                                  : 400.0;
                            });
                          },
                          child: AnimatedContainer(
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: _containerWidth,
                            height: _containerHeight,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                            alignment: Alignment.centerLeft,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: getProportionateScreenWidth(100),
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 15.0),
                                      child: Image.asset(
                                        'assets/images/vecteezy_delivery-truck-with-parcel-box-transport-vehicle-3d-rendering_24830514 (1).png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: _containerWidth == 400.0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height:
                                              getProportionateScreenHeight(20),
                                        ),
                                        Center(
                                          child: Text(
                                            "Kamyon",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Hacimce büyük veya sayıca fazla\ngönderileriniz için oto kurye hazır! ',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          '20-100 kg',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(10)),

                    //KAMPANYALAR
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kampanyalar',
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(18),
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor,
                            ),
                          ),
                          SizedBox(height: getProportionateScreenHeight(10)),
                          Container(
                            height: getProportionateScreenHeight(200),
                            child: ListView.builder(
                              itemCount: imageList.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(right: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(150),
                                        child: Stack(
                                          children: [
                                            InkWell(
                                              onTap: () {},
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.asset(
                                                  width:
                                                      getProportionateScreenWidth(
                                                          200),
                                                  imageList[index],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(10),
                                      ),
                                      Container(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                textTitle[index],
                                                style: TextStyle(
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          13),
                                                  fontWeight: FontWeight.bold,
                                                  color: kSecondaryColor,
                                                ),
                                              ),
                                              SizedBox(
                                                width:
                                                    getProportionateScreenWidth(
                                                        10),
                                              ),
                                              Image.asset(
                                                'assets/icons/Arturo-Wibawa-Akar-Chevron-right-small.512.png',
                                                width:
                                                    getProportionateScreenWidth(
                                                        16),
                                                color: kSecondaryColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                    //KAMPANYALAR
                    //
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LiveSupportPage(),
              ),
            );
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
