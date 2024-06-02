import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/services/user_profile.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<String> getStoredData(String key) async {
  final prefs = await SharedPreferences.getInstance();
  final data = prefs.getString(key);
  return data ?? '';
}

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
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final token = responseData['data']['token'];
        if (token != null) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('auth_token', token);
          
          final user_datas = await getUserInfo();
          await prefs.setString('full_name', user_datas['full_name']);
          await prefs.setString('email', user_datas['email']);
          await prefs.setString('phone_number', user_datas['phone_number']);
          InitFirebaseMessaging();
        
        } else {
          throw SignInException('Token alınamadı.');
        }
      } else {
        throw SignInException('Kullanıcı adı veya şifre hatalı.');
      }
    } else {
      throw SignInException('Kullanıcı adı veya şifre boş.');
    }
  } catch (e) {
    throw Exception('Giriş sırasında bir hata oluştu: $e');
  }
}

Future<bool> signOut(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('auth_token');
  await prefs.remove('full_name',);
  await prefs.remove('email');
  await prefs.remove('phone_number');
  return true;
}
