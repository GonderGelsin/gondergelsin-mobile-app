import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/pages/profile/components/profile_pic.dart';
import 'package:flutter_application_1/services/user_profile.dart' as profile;
import 'package:flutter_application_1/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Map<String, dynamic>? userInfo;
  late Future<Map<String, dynamic>> userInfoFuture;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    userInfoFuture = _refreshUserInfo();
  }

  Future<Map<String, dynamic>> _refreshUserInfo() async {
    try {
      final data = await profile.getUserInfo();
      setState(() {
        userInfo = data;
        isLoading = false;
      });
      return data;
    } catch (error) {
      print('Error refreshing user info: $error');
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePic(),
        SizedBox(height: getProportionateScreenHeight(20)),
        FutureBuilder<Map<String, dynamic>>(
          future: userInfoFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final data = snapshot.data!;
              return Column(
                children: [
                  ProfileTextField(
                    text: "Ad",
                    initialValue: data['first_name'],
                    onChanged: (value) {},
                    enabled: false,
                  ),
                  ProfileTextField(
                    text: "Soyad",
                    initialValue: data['last_name'],
                    onChanged: (value) {},
                    enabled: false,
                  ),
                  ProfileTextField(
                    text: "TC Kimlik",
                    initialValue: data['turkish_id_number'],
                    onChanged: (value) {},
                    enabled: false,
                  ),
                  ProfileTextField(
                    text: "Telefon Numarası",
                    initialValue: data['phone_number'],
                    onChanged: (value) {},
                    rightIcon:
                        "assets/icons/Arturo-Wibawa-Akar-Arrow-left.512.png",
                    onTapIcon: () => _editUserInfo('phone_number'),
                  ),
                  ProfileTextField(
                    text: "Email",
                    initialValue: data['email'],
                    onChanged: (value) {},
                    rightIcon:
                        "assets/icons/Arturo-Wibawa-Akar-Arrow-left.512.png",
                    onTapIcon: () => _editUserInfo('email'),
                  ),
                ],
              );
            }
          },
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
          title: Text(
            'Bilgiyi Düzenle',
            textAlign: TextAlign.center,
          ),
          content: TextFormField(
            initialValue: currentValue,
            onChanged: (newValue) {
              currentValue = newValue;
            },
          ),
          actions: <Widget>[
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop(currentValue);
                },
                child: Text(
                  'Tamam',
                  style: TextStyle(
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    if (newValue != null) {
      setState(() {
        userInfo?[field] = newValue;
      });
      await profile.updateUserInfo(userInfo!);
      // Yenileme işlemi
      setState(() {
        userInfoFuture = _refreshUserInfo();
      });
    }
  }
}

class ProfileTextField extends StatelessWidget {
  final String text;
  final String initialValue;
  final ValueChanged<String>? onChanged;
  final String? rightIcon;
  final VoidCallback? onTapIcon;
  final bool enabled;

  const ProfileTextField({
    Key? key,
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
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              enabled: enabled,
              initialValue: initialValue,
              onChanged: onChanged,
              decoration: InputDecoration(
                labelText: text,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                suffixIcon: rightIcon != null
                    ? GestureDetector(
                        onTap: onTapIcon,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Image.asset(
                            rightIcon!,
                            height: getProportionateScreenHeight(25),
                            color: kPrimaryColor,
                          ),
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
