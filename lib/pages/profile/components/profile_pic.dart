import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/size_config.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(100),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black45, // İstediğiniz rengi buraya koyabilirsiniz
                BlendMode.srcATop,
              ),
              child: Image.asset("assets/images/profile.png"),
            ),
          ),
          Positioned(
            child: SizedBox(
              height: getProportionateScreenHeight(46),
            ),
          ),
        ],
      ),
    );
  }
}
