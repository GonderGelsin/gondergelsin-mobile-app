import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/components/default_button.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/pages/sign_in/sign_in_screen.dart';
import 'package:flutter_application_1/pages/splash/components/splash_content.dart';
import 'package:flutter_application_1/size_config.dart';
import 'package:flutter_application_1/translations/locale_keys.g.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  PageController _pageController = PageController();

  List<Map<String, String>> splashData = [
    {
      "text": LocaleKeys.welcome_lets_go.tr(),
      "image": "assets/images/design-1710195127425 (1)-modified (1).png"
    },
    {
      "text": LocaleKeys.send_courier.tr(),
      "image":
          "assets/images/vecteezy_3d-delivery-man-character-jump-from-phone-screen-with_39557580.png"
    },
    {
      "text": LocaleKeys.fast_delivery.tr(),
      "image":
          "assets/images/vecteezy_3d-entrega-hombre-personaje-entregando-paquete-con-un-scooter_36876838.png"
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _pageController,
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"]!,
                  text: splashData[index]["text"]!,
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: <Widget>[
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) => buildDot(index: index),
                        ),
                      ),
                      Spacer(flex: 2),
                      if (currentPage == splashData.length - 1)
                        DefaultButton(
                          text: LocaleKeys.continue_.tr(),
                          press: () {
                            Navigator.pushNamed(
                                context, SignInScreen.routeName);
                          },
                        ),
                      Spacer(),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index = 0}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}
