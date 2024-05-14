import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/home_screen.dart';
import 'package:http/http.dart' as http;

//Response dönüş tipi
class SignInResponse {
  //alınacak değişkenler
  final String refresh;
  final String access;
  final String status;

  //gelen veriden alınacak değerleri çekme
  SignInResponse(
      {required this.refresh, required this.access, required this.status});

  //json gelen verileri istenen formata dönüştürme
  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return SignInResponse(
      refresh: json['refresh'],
      access: json['access'],
      status: json['status'],
    );
  }
}

class SignUpResponse {
  final String status;

  SignUpResponse({required this.status});

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      status: json['status'],
    );
  }
}

//Login olma fonksiyonu
Future<SignInResponse> signUserIn(
    BuildContext context, usernameController, passwordController) async {
  final url = Uri.parse(
      'https://gondergelsin.pythonanywhere.com/authentication/login/');
  try {
    final username = usernameController.text;
    final password = passwordController.text;

    if (username != null && password != null) {
      final cevap = await http.post(
        url,
        body: {
          'username': username,
          'password': password,
        },
      );
      if (cevap.statusCode == 200) {
        // Başarılı bir yanıt aldığınızda, bu yanıtı işleyerek Response nesnesini oluşturun.
        Navigator.pushNamed(context, HomePage.routeName);
        return SignInResponse.fromJson(json.decode(cevap.body));
      } else {
        // Başarısız bir yanıt durumunda hata mesajını döndürün.
        throw Exception('Kullanıcı adı veya şifre hatalı.');
      }
    } else {
      throw Exception('Kullanıcı adı veya şifre boş.');
    }
  } catch (e) {
    // Hata durumunda kullanıcıya bir hata mesajı gösterilebilir.
    print('Hata oluştu: $e');
    throw e;
  }
}

Future<SignUpResponse> register(
  tcController,
  nameController,
  surnameController,
  phoneNumberController,
  emailController,
  passwordController,
) async {
  final url = Uri.parse(
      'https://gondergelsin.pythonanywhere.com/authentication/register/');
  try {
    final name = nameController.text;
    final surname = surnameController.text;
    final phoneNumber = phoneNumberController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final tcNumber = tcController.text;

    if (name.isNotEmpty &&
        surname.isNotEmpty &&
        phoneNumber.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        tcNumber.isNotEmpty) {
      final request = await http.post(
        url,
        body: {
          'first_name': name,
          'last_name': surname,
          'email': email,
          'phone_number': phoneNumber,
          'password': password,
          'turkish_id_number': tcNumber,
        },
      );

      final response = SignUpResponse.fromJson(json.decode(request.body));
      print(response);
      print(request);
      return response;
    } else {
      throw Exception('Boş alanları doldurun.');
    }
  } catch (e) {
    print('Hata oluştu: $e');
    throw e;
  }
}
