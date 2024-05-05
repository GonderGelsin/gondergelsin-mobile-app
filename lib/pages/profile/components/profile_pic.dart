 import 'package:flutter/material.dart';
import 'package:flutter_application_1/size_config.dart';

 

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(115),
      width: getProportionateScreenWidth(115),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/profile.png"),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: SizedBox(
              height: getProportionateScreenHeight(46),
              width: getProportionateScreenWidth(46),
              
              child: TextButton(
                
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  
                  backgroundColor: Color.fromARGB(255, 227, 229, 233), // Buton arka plan rengi
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white),
                    
    
                  )
                ),
                
                onPressed: () {},
                
                  child: Container(
                     decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFFF5F6F9),
                     ),
                  child: Image.asset("assets/icons/Arturo-Wibawa-Akar-Plus.512.png"),
                   
                 ),// Artı ikonu
                ),
              ),
            ),
          
        ],
      ),
    );
  }
}