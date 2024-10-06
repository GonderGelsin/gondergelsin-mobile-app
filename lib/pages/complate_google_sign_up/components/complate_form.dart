import 'package:flutter/material.dart';
import 'package:gondergelsin_mobile_app/components/default_button.dart';
import 'package:gondergelsin_mobile_app/services/authentication.dart';

class CompleteProfileScreen extends StatefulWidget {
  final String? email;
  final String? name;

  CompleteProfileScreen({this.email, this.name});

  @override
  _CompleteProfileScreenState createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController tcController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Ad Soyad ve Email Google'dan otomatik doldurulacak
                  TextFormField(
                    initialValue: widget.name ?? '',
                    decoration: InputDecoration(
                      labelText: 'Ad-Soyad',
                    ),
                    readOnly: true,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    initialValue: widget.email ?? '',
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    readOnly: true,
                  ),
                  SizedBox(height: 20),

                  // Kullanıcıdan eksik bilgileri alalım
                  TextFormField(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Telefon Numarası',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Telefon numarası gerekli';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: tcController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'TC Kimlik Numarası',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'TC Kimlik numarası gerekli';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Şifre',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Şifre gerekli';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 40),

                  DefaultButton(
                      text: "Kaydı Tamamla",
                      press: () {
                        if (_formKey.currentState!.validate()) {
                          // Eksik bilgiler tamamlandı, backend'e kaydedin
                          completeRegistration();
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Map<String, String> _getFirstAndLastName(String displayName) {
    List<String> nameParts = displayName.split(" ");

    String firstName = "";
    String lastName = "";

    if (nameParts.length == 1) {
      firstName = nameParts[0];
    } else if (nameParts.length == 2) {
      firstName = nameParts[0];
      lastName = nameParts[1];
    } else if (nameParts.length >= 3) {
      firstName = nameParts.sublist(0, nameParts.length - 1).join(" ");
      lastName = nameParts.last;
    }

    return {
      'firstName': firstName,
      'lastName': lastName,
    };
  }

  void completeRegistration() {
    var nameParts = _getFirstAndLastName(widget.name ?? "");

    String firstName = nameParts['firstName']!;
    String lastName = nameParts['lastName']!;
    String email = widget.email ?? '';
    String phoneNumber = phoneNumberController.text;
    String password = passwordController.text;
    String tcNumber = tcController.text;

    registerGoogleUser(
      email: email,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      password: password,
      tcNumber: tcNumber,
    ).then((response) {
      Navigator.pushReplacementNamed(context, "/home");
    }).catchError((error) {
      print("Kayıt sırasında hata oluştu: $error");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Kayıt sırasında bir hata oluştu: $error")),
      );
    });
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    tcController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
