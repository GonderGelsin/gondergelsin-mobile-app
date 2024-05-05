import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/pages/profile/components/profile_menu.dart';
import 'package:flutter_application_1/pages/profile/components/profile_pic.dart';
import 'package:flutter_application_1/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      ProfilePic(),
      SizedBox(height: getProportionateScreenHeight(20)),
      ProfileMenu(
        icon: "assets/icons/Arturo-Wibawa-Akar-Person.512.png",
       text: "My Account",
       press:   () {},
       ),
       ProfileMenu(
        icon: "assets/icons/Arturo-Wibawa-Akar-Bell.512.png",
       text: "Notifications",
       press:   () {},
       ),
       ProfileMenu(
        icon: "assets/icons/Colebemis-Feather-Settings.512.png",
       text: "Settings",
       press:   () {},
       ),
       ProfileMenu(
        icon: "assets/icons/Arturo-Wibawa-Akar-Reciept.512.png",
       text: "Help Center",
       press:   () {},
       ),
       ProfileMenu(
        icon: "assets/icons/Arturo-Wibawa-Akar-Sign-out.512.png",
       text: "Log Out",
       press:   () {},
       ),
      ],
    );
  }
}
