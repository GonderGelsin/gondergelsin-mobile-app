import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login_succes/login_succes_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Response {
  // alınacak değişkenler
final String full_name;
final String first_name;
final String last_name;
final String phone_number;
final String email;
final String turkish_id_number;
  // gelen veriden alınacak değerleri çekme
  Response({required this.full_name, required this.first_name, required this.last_name, required this.phone_number, required this.email, required this.turkish_id_number});

  // json gelen verileri istenen formata dönüştürme
  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      full_name : json['full_name'],
      first_name : json['first_name'],
      last_name : json['last_name'],
      phone_number : json['phone_number'],
      email : json['email'],
      turkish_id_number : json['turkish_id_number'],
    );
  }
}

Future<Response> getUserData(
  BuildContext context,
  fullNameController,
  firstNameController,
  lastNameController,
  phoneNumberController,
  emailController,
  turkishIdNumberController,
) async {
  // API URL
  final url = Uri.parse('https://gondergelsin.pythonanywhere.com/user/');

  // HTTP Headers
  final headers = {
    "Authorization": "Token 51df4ef237575b3b7981f5facc124961c34c2a03",
    "Content-Type": "application/json",
  };

  // Kullanıcı bilgilerini al
  final full_name = fullNameController.text;
  final first_name = firstNameController.text;
  final last_name = lastNameController.text;
  final phone_number = phoneNumberController.text;
  final email = emailController.text;
  final turkish_id_number = turkishIdNumberController.text;

  // İstek gövdesini oluştur
  final body = jsonEncode({
    "full_name": full_name,
    "first_name": first_name,
    "last_name": last_name,
    "phone_number": phone_number,
    "email": email,
    "turkish_id_number": turkish_id_number,
  });

  try {
    // HTTP POST isteğini yap ve yanıtı bekle
    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    // Yanıtı dönüştürerek Response sınıfının bir örneği oluştur
    final responseData = jsonDecode(response.body);
    final responseObject = Response.fromJson(responseData);

    // Oluşturulan response nesnesini döndür
    return responseObject;
  } catch (error) {
    // Hata durumunda null döndür
    print(error);
    return Response(full_name: full_name, first_name: first_name, last_name: last_name, phone_number: phone_number, email: email, turkish_id_number: turkish_id_number);
  }
}
// Future<Response> register(
//   nameController,
//   surnameController,
//   phoneNumberController,
//   emailController,
//   passwordController,
// ) async {
//   final url = Uri.parse(
//       'https://gondergelsin.pythonanywhere.com/authentication/register/');
//   try {
//     final name = nameController.text;
//     final surname = surnameController.text;
//     final phoneNumber = phoneNumberController.text;
//     final email = emailController.text;
//     final password = passwordController.text;

//     if (name.isNotEmpty &&
//         surname.isNotEmpty &&
//         phoneNumber.isNotEmpty &&
//         email.isNotEmpty &&
//         password.isNotEmpty) {
//       final cevap = await http.post(
//         url,
//         body: {
//           'first_name': name,
//           'last_name': surname,
//           'email': email,
//           'phone_number': phoneNumber, // Telefon numarasını da gönder
//           'password': password,
//           'turkish_id_number': '57097496018',
//         },
//       );
//       print(cevap.body);
//       if (cevap.statusCode == 200) {
//         // Başarılı bir yanıt aldığınızda, bu yanıtı işleyerek Response nesnesini oluşturun.
//         return Response.fromJson(json.decode(cevap.body));
//       } else {
//         // Başarısız bir yanıt durumunda hata mesajını döndürün.
//         throw Exception('Kullanıcı adı veya şifre hatalı.');
//       }
//     } else {
//       throw Exception('Boş alanları doldurun.');
//     }
//   } catch (e) {
//     // Hata durumunda kullanıcıya bir hata mesajı gösterilebilir.
//     print('Hata oluştu: $e');
//     throw e;
//   }
// }
