//import 'dart:html';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/components/my_textField.dart';
import 'package:flutter_application_1/components/square_tile.dart';
import 'package:flutter_application_1/my_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //Text Editing Controllers
  final usernameController = TextEditingController();
  final PasswordController = TextEditingController();

  //Sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              //LOGO

              Container(
                height: 300,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(40, 30),
                    bottomRight: Radius.elliptical(40, 30),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/login_pack2.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 50),

              //Giriş Yap

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Giriş Yap',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                  ],
                ),
              ),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Hoşgeldiniz!',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              //Kullanici Adi
              MyTextField(
                controller: usernameController,
                hintText: 'E-mail',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              //Sifre
              MyTextField(
                controller: PasswordController,
                hintText: 'Sifre',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              //Sifremi Unuttum
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Şifremi Unuttum ?',
                        style: TextStyle(color: Colors.grey[600])),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              //Giriş Yap
              const SizedBox(height: 10),
              MyButton(
                onTap: signUserIn,
              ),

              const SizedBox(height: 25),

              //ya da

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'ya da',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey[400],
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              //google+facebook
              Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
                //google button
                SquareTile(imagePath: 'assets/images/search.png'),
                SizedBox(width: 25),
                //facebook button
                SquareTile(imagePath: 'assets/images/facebook.png'),
              ]),

              const SizedBox(height: 15),

              //Hesabın yok mu? Kayıt ol

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hesabın yok mu?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Kayıt Ol',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
