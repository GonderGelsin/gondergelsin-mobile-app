import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    Color scarletColor = Color.fromARGB(255, 231, 13, 13); // Scarlet rengi
    Color yellowColor = Color.fromARGB(255, 226, 155, 2);
    return MaterialApp(
      title: 'GONDER GELSIN',
      home: Scaffold(
        backgroundColor: scarletColor,
        appBar: AppBar(
          title: Text('GONDER GELSIN'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Kullanıcı Adı',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: yellowColor, // Sarı rengi burada ayarlayın
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Şifre',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: yellowColor, // Sarı rengi burada ayarlayın
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Kullanıcı adı ve şifre doğrulaması yapılabilir
                },
                child: Text('Giriş Yap'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}