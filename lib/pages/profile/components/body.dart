import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/profile/components/profile_pic.dart';
import 'package:flutter_application_1/services/user_profile.dart' as profile;
import 'package:flutter_application_1/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Map<String, dynamic>? userInfo;
  bool isLoading = true; 

  @override
  void initState() {
    super.initState();

    profile.getUserInfo().then((data) {
      setState(() {
        userInfo = data;
        isLoading = false; 
        print(userInfo?['first_name'] ?? "xxx");
      });
    }).catchError((error) {
      setState(() {
        isLoading = false; 
      });
      print('Error: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePic(),
        SizedBox(height: getProportionateScreenHeight(20)),
        isLoading 
            ? CircularProgressIndicator() 
            : Column(
                children: [
                  ProfileTextField(
                    leftIcon: "assets/icons/Arturo-Wibawa-Akar-Three-line-horizontal.512.png",
                    text: "Ad",
                    initialValue: userInfo?['first_name'] ?? "",
                    onChanged: (value) {},
                    
                  ),
                  ProfileTextField(
                    leftIcon: "assets/icons/Arturo-Wibawa-Akar-Three-line-horizontal.512.png",
                    text: "Soyad",
                    initialValue: userInfo?['last_name'] ?? "",
                    onChanged: (value) {},
                    
                  ),
                  ProfileTextField(
                    leftIcon: "assets/icons/Arturo-Wibawa-Akar-Three-line-horizontal.512.png",
                    text: "TC Kimlik",
                    initialValue: userInfo?['turkish_id_number'] ?? "",
                    onChanged: (value) {},
                    
                  ),
                  ProfileTextField(
                    leftIcon: "assets/icons/Arturo-Wibawa-Akar-Three-line-horizontal.512.png",
                    text: "Telefon Numarası",
                    initialValue: userInfo?['phone_number'] ?? "",
                    onChanged: (value) {},
                    rightIcon: "assets/icons/Arturo-Wibawa-Akar-Arrow-left.512.png", // rightIcon ekleyin
                  ),
                  ProfileTextField(
                    leftIcon: "assets/icons/Arturo-Wibawa-Akar-Three-line-horizontal.512.png",
                    text: "Email",
                    initialValue: userInfo?['email'] ?? "",
                    onChanged: (value) {},
                    rightIcon: "assets/icons/Arturo-Wibawa-Akar-Arrow-left.512.png", // rightIcon ekleyin
                  ),
                ],
              ),
      ],
    );
  }
}

class ProfileTextField extends StatelessWidget {
  final String leftIcon;
  final String text;
  final String initialValue;
  final ValueChanged<String>? onChanged;
  final String? rightIcon;

  const ProfileTextField({
    Key? key,
    required this.leftIcon,
    required this.text,
    required this.initialValue,
    this.onChanged,
    this.rightIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Image.asset(
            leftIcon,
            width: 24,
            height: 24,
          ),
          SizedBox(width: 20),
          Expanded(
            child: TextFormField(
              initialValue: initialValue,
              onChanged: onChanged,
              decoration: InputDecoration(
                labelText: text,
                border: OutlineInputBorder(),
                suffixIcon: rightIcon != null ? IconButton(
                  onPressed: () {}, // onPressed özelliğini ekleyin
                  icon: Image.asset(
                    rightIcon!,
                    width: 24,
                    height: 24,
                  ),
                ) : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
