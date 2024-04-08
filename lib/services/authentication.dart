import 'package:http/http.dart' as http;
import 'dart:convert';

//Response dönüş tipi
class Response {
  //alınacak değişkenler
  final String refresh;
  final String access;

  //gelen veriden alınacak değerleri çekme
  Response({required this.refresh, required this.access});

  //json gelen verileri istenen formata dönüştürme
  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      refresh: json['refresh'],
      access: json['access'],
    );
  }
}

//Login olma fonksiyonu
Future<Response> signUserIn(usernameController, passwordController) async {
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
        return Response.fromJson(json.decode(cevap.body));
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

Future<Response> register(
  nameController,
  surnameController,
  phoneNumberController,
  emailController,
  passwordController,
) async {
  final url = Uri.parse(
      'https://gondergelsin.pythonanywhere.com/authentication/login/');
  try {
    final name = nameController.text;
    final surname = surnameController.text;
    final phoneNumber = phoneNumberController.text;
    final email = emailController.text;
    final password = passwordController.text;

    if (name != null &&
        surname != null &&
        phoneNumber != null &&
        email != null &&
        password != null) {
      final cevap = await http.post(
        url,
        body: {
          'name': name,
          'surname': surname,
          'phoneNumber': phoneNumber,
          'email': email,
          'password': password,
        },
      );
      if (cevap.statusCode == 200) {
        // Başarılı bir yanıt aldığınızda, bu yanıtı işleyerek Response nesnesini oluşturun.
        return Response.fromJson(json.decode(cevap.body));
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
