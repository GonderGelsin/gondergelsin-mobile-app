import 'dart:ui';
import 'package:flutter_application_1/services/authentication.dart'
    as authentication;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/components/my_textField.dart';
import 'package:flutter_application_1/components/square_tile.dart';
import 'package:flutter_application_1/pages/register_page.dart';
import 'package:flutter_application_1/pages/welcome_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              //LOGO
              Stack(
                alignment: Alignment.topLeft,
                children: [
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5.0, 20.0, 0.0, 0.0),
                    child: IconButton(
                      icon: Icon(arrow_back_ios_rounded, color: Colors.black),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomePage()));
                      },
                    ),
                  ),
                ],
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

              //Kullanici Adi kısmı
              MyTextField(
                controller: _usernameController,
                hintText: 'E-mail',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              //Sifre kısmı
              MyTextField(
                controller: _passwordController,
                hintText: 'Sifre',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              //Sifremi Unuttum kısmı
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

              //Giriş Yap kısmı
              const SizedBox(height: 10),

              MyButton(
                onTap: () {
                  authentication.signUserIn(
                      _usernameController, _passwordController);
                },
              ),

              const SizedBox(height: 25),

              //ya da kısmı

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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    child: Container(
                      child: Center(
                        child: const Text(
                          'Kayıt Ol',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final VoidCallback onTap;

  const MyButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          onTap, // onTap parametresini kullanarak signUserIn fonksiyonunu tetikler
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: const Center(
          child: Text(
            'Giriş Yap',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
