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
  bool isLoading = true; // Yükleme durumu kontrolü için değişken

  @override
  void initState() {
    super.initState();

    profile.getUserInfo().then((data) {
      setState(() {
        userInfo = data;
        isLoading = false; // Veri geldi, yükleme durumu bitmiş
        print(userInfo?['first_name'] ?? "xxx");
      });
    }).catchError((error) {
      setState(() {
        isLoading = false; // Hata oluştu, yükleme durumu bitmiş
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
        isLoading // isLoading true ise, yükleme durumunu göster
            ? CircularProgressIndicator() // Yükleme göstergesi
            : Column(
                children: [
                  ProfileTextField(
                    icon: "assets/icons/Arturo-Wibawa-Akar-Person.512.png",
                    text: "Ad",
                    initialValue: userInfo?['first_name'] ?? "",
                    onChanged: (value) {},
                  ),
                  ProfileTextField(
                    icon: "assets/icons/Arturo-Wibawa-Akar-Person.512.png",
                    text: "Soyad",
                    initialValue: userInfo?['last_name'] ?? "",
                    onChanged: (value) {},
                  ),
                  ProfileTextField(
                    icon: "assets/icons/Arturo-Wibawa-Akar-Bell.512.png",
                    text: "TC Kimlik",
                    initialValue: userInfo?['turkish_id_number'] ?? "",
                    onChanged: (value) {},
                  ),
                  ProfileTextField(
                    icon: "assets/icons/Arturo-Wibawa-Akar-Person.512.png",
                    text: "Telefon Numarası",
                    initialValue: userInfo?['phone_number'] ?? "",
                    onChanged: (value) {},
                  ),
                  ProfileTextField(
                    icon: "assets/icons/Colebemis-Feather-Settings.512.png",
                    text: "Email",
                    initialValue: userInfo?['email'] ?? "",
                    onChanged: (value) {},
                  ),
                ],
              ),
      ],
    );
  }
}

class ProfileTextField extends StatelessWidget {
  final String icon;
  final String text;
  final String initialValue;
  final ValueChanged<String>? onChanged;

  const ProfileTextField({
    Key? key,
    required this.icon,
    required this.text,
    required this.initialValue,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Image.asset(
            icon,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
