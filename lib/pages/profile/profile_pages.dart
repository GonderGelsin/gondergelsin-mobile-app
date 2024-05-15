import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';


import 'package:flutter_application_1/size_config.dart';

import 'components/body.dart';



class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
   
  }) :  super(key:key);

   

  @override
  Widget build(BuildContext context) {
    
    return Container (
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
      color: Colors.white ,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, -15),
          blurRadius: 20,
          color: Color(0xFFDADADA).withOpacity(0.15),
        ),
      ],
    ),
    child: SafeArea(
      child: Row(
            children: [
             
              IconButton(
                icon: Image.asset(
                  "assets/icons/Arturo-Wibawa-Akar-Home-alt-1.512.png",
                  
                 color: kPrimaryColor,
                  width: getProportionateScreenWidth(70),
                  height: getProportionateScreenHeight(40),
                ),
                onPressed: ()  {},
               ),
               Padding(padding: EdgeInsets.symmetric(horizontal: 105)),
               IconButton(
                icon: Image.asset(
                  "assets/icons/Colebemis-Feather-Settings.512.png",
                   color: kPrimaryColor ,
                  
                  width: getProportionateScreenWidth(70),
                  height: getProportionateScreenHeight(40),
                ),
                onPressed: ()  {},
               ),
            ],
            ),
    ),
    );
  }
}