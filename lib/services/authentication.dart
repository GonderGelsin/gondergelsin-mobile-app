import 'dart:convert';

import 'package:flutter/material.dart';
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

class SignInException implements Exception {
  final String message;
  SignInException(this.message);

  @override
  String toString() => "SignInException: $message";
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

Future<Null> signUserIn(
    BuildContext context,
    TextEditingController usernameController,
    TextEditingController passwordController) async {
  final url = Uri.parse(
      'https://gondergelsin.pythonanywhere.com/authentication/login/');
  try {
    final username = usernameController.text;
    final password = passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      final response = await http.post(
        url,
        body: {
          'username': username,
          'password': password,
        },
      );
      if (response.statusCode != 200) {
        throw SignInException('Kullanıcı adı veya şifre hatalı.');
      }
    } else {
      throw SignInException('Kullanıcı adı veya şifre boş.');
    }
  } catch (e) {
    throw Exception('Giriş sırasında bir hata oluştu.');
  }
}
