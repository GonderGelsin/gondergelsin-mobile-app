import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/components/home_screen.dart'; // HomePage widget'ının bulunduğu yer

class BodySucces extends StatelessWidget {
  static String routName = "/body_succes";
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Giriş Tamamlandı",
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 200), // Araya bir boşluk ekleyelim
        MyButton(
          onTap: () {
            // Ana sayfaya dönme işlemi
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ],
    );
  }
}

class MyButton extends StatelessWidget {
  final VoidCallback onTap;

  const MyButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Text(
            'Ana Sayfaya Dön',
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
