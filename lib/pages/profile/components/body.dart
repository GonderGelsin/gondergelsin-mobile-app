import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/profile/components/profile_menu.dart';
import 'package:flutter_application_1/pages/profile/components/profile_pic.dart';
import 'package:flutter_application_1/services/user_profile.dart' as profile;
import 'package:flutter_application_1/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Map<String, dynamic>? userInfo;

  @override
  void initState() {
    super.initState();
    // Sayfa oluşturulduğunda getUserInfo fonksiyonunu çağırma
    profile.getUserInfo().then((data) {
      setState(() {
        userInfo = data;
      });
    }).catchError((error) {
      // Hata durumunda bir işlem yapabilirsiniz
      print('Error: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePic(),
        SizedBox(height: getProportionateScreenHeight(20)),
        ProfileMenu(
          icon: "assets/icons/Arturo-Wibawa-Akar-Person.512.png",
          text: "My Account",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/icons/Arturo-Wibawa-Akar-Bell.512.png",
          text: "Notifications",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/icons/Colebemis-Feather-Settings.512.png",
          text: "Settings",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/icons/Arturo-Wibawa-Akar-Reciept.512.png",
          text: "Help Center",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/icons/Arturo-Wibawa-Akar-Sign-out.512.png",
          text: "Log Out",
          press: () {},
        ),
      ],
    );
  }
}
