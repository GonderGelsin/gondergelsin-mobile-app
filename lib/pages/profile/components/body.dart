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
  // TextEditingController'leri tanımla
  final fullNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final turkishIdNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Sayfa yüklendiğinde sunucuya istek at
    getDataFromServer();
  }

  @override
  void dispose() {
    // Controller'leri temizle
    fullNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    turkishIdNumberController.dispose();
    super.dispose();
  }

  // Sunucudan verileri al
  void getDataFromServer() async {
    try {
      final response = await profile.getUserData(
        context,
        fullNameController,
        firstNameController,
        lastNameController,
        phoneNumberController,
        emailController,
        turkishIdNumberController,
      );


        setState(() {
          fullNameController.text = response.full_name;
          firstNameController.text = response.first_name;
          lastNameController.text = response.last_name;
          phoneNumberController.text = response.phone_number;
          emailController.text = response.email;
          turkishIdNumberController.text = response.turkish_id_number;
        });
    } catch (error) {
      // Hata işleme mekanizması
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePic(),
        SizedBox(height: getProportionateScreenHeight(20)),
        buildTextField("Full Name", fullNameController),
        buildTextField("First Name", firstNameController),
        buildTextField("Last Name", lastNameController),
        buildTextField("Phone Number", phoneNumberController),
        buildTextField("Email", emailController),
        buildTextField("Turkish ID Number", turkishIdNumberController),
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

  Widget buildTextField(String labelText, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: "Enter $labelText",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.black),
            gapPadding: 10,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.black),
            gapPadding: 10,
          ),
        ),
      ),
    );
  }
}
