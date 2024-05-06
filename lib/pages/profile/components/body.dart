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
                    enabled: false,
                  ),
                  ProfileTextField(
                    leftIcon: "assets/icons/Arturo-Wibawa-Akar-Three-line-horizontal.512.png",
                    text: "Soyad",
                    initialValue: userInfo?['last_name'] ?? "",
                    onChanged: (value) {},
                    enabled: false,
                  ),
                  ProfileTextField(
                    leftIcon: "assets/icons/Arturo-Wibawa-Akar-Three-line-horizontal.512.png",
                    text: "TC Kimlik",
                    initialValue: userInfo?['turkish_id_number'] ?? "",
                    onChanged: (value) {},
                    enabled: false,
                  ),
                  ProfileTextField(
                    leftIcon: "assets/icons/Arturo-Wibawa-Akar-Three-line-horizontal.512.png",
                    text: "Telefon Numarası",
                    initialValue: userInfo?['phone_number'] ?? "",
                    onChanged: (value) {},
                    rightIcon: "assets/icons/Arturo-Wibawa-Akar-Arrow-left.512.png",
                    onTapIcon: () => _editUserInfo('phone_number'),
                    
                  ),
                  ProfileTextField(
                    leftIcon: "assets/icons/Arturo-Wibawa-Akar-Three-line-horizontal.512.png",
                    text: "Email",
                    initialValue: userInfo?['email'] ?? "",
                    onChanged: (value) {},
                    rightIcon: "assets/icons/Arturo-Wibawa-Akar-Arrow-left.512.png",
                    onTapIcon: () => _editUserInfo('email'),
                    
                  ),
                ],
              ),
      ],
    );
  }

  void _editUserInfo(String field) async {
    final newValue = await showDialog(
      context: context,
      builder: (BuildContext context) {
        String currentValue = userInfo?[field] ?? "";
        return AlertDialog(
          title: Text('Bilgiyi Düzenle'),
          content: TextFormField(
            initialValue: currentValue,
            onChanged: (newValue) {
              currentValue = newValue;
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(currentValue);
              },
              child: Text('Tamam'),
            ),
          ],
        );
      },
    );

    if (newValue != null) {
      setState(() {
        userInfo?[field] = newValue;
      });
      // Kullanıcı bilgilerini güncelleme işlemleri burada yapılabilir
    }
  }
}

class ProfileTextField extends StatelessWidget {
  final String leftIcon;
  final String text;
  final String initialValue;
  final ValueChanged<String>? onChanged;
  final String? rightIcon;
  final VoidCallback? onTapIcon;
  final bool enabled;

  const ProfileTextField({
    Key? key,
    required this.leftIcon,
    required this.text,
    required this.initialValue,
    this.onChanged,
    this.rightIcon,
    this.onTapIcon,
    this.enabled = true,
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
              enabled: enabled,
              initialValue: initialValue,
              onChanged: onChanged,
              decoration: InputDecoration(
                labelText: text,
                border: OutlineInputBorder(),
                suffixIcon: rightIcon != null
                    ? GestureDetector(
                        onTap: onTapIcon,
                        child: Image.asset(
                          rightIcon!,
                          width: 24,
                          height: 24,
                        ),
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
