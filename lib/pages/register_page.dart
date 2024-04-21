import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_textField.dart';
import 'package:flutter_application_1/pages/welcome_page.dart';
import 'package:flutter_application_1/services/authentication.dart'
    as authentication;

const IconData arrow_back_ios_rounded =
    IconData(0xf571, fontFamily: 'MaterialIcons', matchTextDirection: true);

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(arrow_back_ios_rounded),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomePage()));
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 80),

            //Kayıt Ol

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Kayıt Ol',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              ],
            ),

            const SizedBox(height: 70),

            //isim
            MyTextField(
              controller: _nameController,
              hintText: 'Adınız',
              obscureText: false,
            ),
            const SizedBox(height: 15),
            MyTextField(
                controller: _surnameController,
                hintText: 'Soyadınız',
                obscureText: false),
            const SizedBox(height: 15),
            MyTextField(
                controller: _phoneNumberController,
                hintText: 'Telefon Numaranız',
                obscureText: false),
            const SizedBox(height: 15),
            MyTextField(
                controller: _emailController,
                hintText: 'Mail Adresiniz',
                obscureText: false),
            const SizedBox(height: 15),
            MyTextField(
                controller: _passwordController,
                hintText: 'Şifreniz',
                obscureText: true),

            const SizedBox(height: 50),

            MyButton(
              onTap: () {
                authentication.register(
                    _nameController,
                    _surnameController,
                    _phoneNumberController,
                    _emailController,
                    _passwordController);
              },
            ),
          ],
        )),
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
            'Kayıt Ol',
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
