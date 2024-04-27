import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/size_config.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 3,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "GÖNDER GELSİN",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(36),
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("Hoşgeldiniz, Hadi İlerleyelim!"),
                      Spacer(
                        flex: 2,
                      ),
                      Image.asset(
                        "assets/images/design-1710195127425 (1).png",
                        height: getProportionateScreenHeight(265),
                        width: getProportionateScreenWidth(235),
                      ),
                    ],
                  )),
              Expanded(flex: 2, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
