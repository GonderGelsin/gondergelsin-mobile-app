import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/pages/createOrder/components/order.dart';
import 'package:flutter_application_1/pages/createOrder/order_screen.dart';
import 'package:flutter_application_1/pages/home/components/service.dart';
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
  List<Order> orders = [];
  List<Order> complatedOrders = [];
  bool showCompletedOrders = false;

  bool showOrders = true; // Başlangıçta Orders gösterilsin

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
  void initState() {
    super.initState();

    _fetchOrders();
    _fetchComplatedOrders();
  }

  Future<void> _fetchOrders() async {
    try {
      List<Order> fetchedOrders = await fetchOrders();

      setState(() {
        orders = fetchedOrders;
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to fetch orders!'),
        ),
      );
    }
  }

  Future<void> _fetchComplatedOrders() async {
    try {
      List<Order> fetchedOrders = await fetchComplatedOrders();

      setState(() {
        complatedOrders = fetchedOrders;
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to fetch orders!'),
        ),
      );
    }
  }

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: getProportionateScreenHeight(10)),
                    BuildNotificationsButton(context),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    buildOrderTitleField(),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    buildVehiclesTitle(),
                    SizedBox(height: getProportionateScreenHeight(10)),
                    BuildAnimatedContainers(),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    BuildCampaignField(context),
                  ],
                ),
              )
            : _widgetOptions[_selectedIndex],
        bottomNavigationBar: BuildBottomNavigationBar(),
        floatingActionButton: BuildFloatingLiveSupportButton(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  Widget buildVehiclesTitle() {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Vehicles',
            style: TextStyle(
              fontSize: getProportionateScreenWidth(20),
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Padding buildOrderTitleField() {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Orders',
            style: TextStyle(
              fontSize: getProportionateScreenWidth(20),
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    showOrders = true; // Orders gösterilsin
                    showCompletedOrders = false;
                  });
                },
                child: Text(
                  "Active Orders",
                  style: TextStyle(
                    fontWeight: showOrders ? FontWeight.bold : FontWeight.w400,
                    fontSize: getProportionateScreenHeight(18),
                    color: showOrders ? kPrimaryColor : kSecondaryColor,
                  ),
                ),
              ),
              SizedBox(width: 10), // Orders ve Completed Orders arasında boşluk
              GestureDetector(
                onTap: () {
                  setState(() {
                    showOrders = false; // Completed Orders gösterilsin
                    showCompletedOrders = true;
                  });
                },
                child: Text(
                  "Completed Orders",
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(18),
                    fontWeight:
                        showCompletedOrders ? FontWeight.bold : FontWeight.w400,
                    color:
                        showCompletedOrders ? kPrimaryColor : kSecondaryColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          if (showOrders)
            BuildOrdersContainer()
          else if (showCompletedOrders)
            BuildCompletedOrdersContainer(),
        ],
      ),
    );
  }

  Row BuildNotificationsButton(BuildContext context) {
    return Row(
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
    );
  }

  FloatingActionButton BuildFloatingLiveSupportButton(BuildContext context) {
    return FloatingActionButton(
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
    );
  }

  ConvexAppBar BuildBottomNavigationBar() {
    return ConvexAppBar(
      backgroundColor: kPrimaryColor,
      height: SizeConfig.screenWidth * 0.17,
      items: [
        TabItem(icon: Icons.home, title: 'Anasayfa'),
        TabItem(icon: Icons.add, title: 'Sipariş Oluştur'),
        TabItem(icon: Icons.settings, title: 'Ayarlar'),
      ],
      initialActiveIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }

  Column BuildAnimatedContainers() {
    return Column(
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
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: getProportionateScreenHeight(10)),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: getProportionateScreenHeight(20),
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
                          '0-20 kg',
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
    );
  }

  Widget BuildOrdersContainer() {
    return Container(
      margin: EdgeInsets.only(right: 8),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              "Active Orders",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(180),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(width: getProportionateScreenWidth(2)),
                ...orders
                    .map((order) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: BuildOrderItem(order),
                        ))
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget BuildCompletedOrdersContainer() {
    return Container(
      margin: EdgeInsets.only(right: 8),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              "Completed Orders",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: getProportionateScreenWidth(2)),
                ...complatedOrders
                    .map((order) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: BuildOrderItem(order),
                        ))
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding BuildCampaignField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Campaigns',
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(150),
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  width: getProportionateScreenWidth(200),
                                  imageList[index],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Row(
                            children: [
                              Text(
                                textTitle[index],
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(13),
                                  fontWeight: FontWeight.bold,
                                  color: kSecondaryColor,
                                ),
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(10),
                              ),
                              Image.asset(
                                'assets/icons/Arturo-Wibawa-Akar-Chevron-right-small.512.png',
                                width: getProportionateScreenWidth(16),
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

Widget BuildOrderItem(Order order) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Status: ${order.status}",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          "Post Content: ${order.postContent}",
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(height: 5),
        Text(
          "Departure Address: ${order.departureAddress}",
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(height: 5),
        Text(
          "Arrival Address: ${order.arrivalAddress}",
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(height: 5),
        Text(
          "Vehicle Type: ${order.vehicleType}",
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(height: 5),
        Text(
          "Weight Limit: ${order.weightLimit}",
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(height: 5),
        Text(
          "Payment Method: ${order.paymentMethod}",
          style: TextStyle(fontSize: 14),
        ),
      ],
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
