import 'dart:convert';

import 'package:flutter_application_1/services/authentication.dart' as authentication;
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getUserInfo() async {
  String apiUrl = 'https://gondergelsin.pythonanywhere.com/user/';

  final authToken = await authentication.getStoredData('auth_token');
  print(authToken);

  http.Response response = await http.get(
    Uri.parse(apiUrl),
    headers: {'Authorization': 'Bearer $authToken'},
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> responseData = jsonDecode(utf8.decode(response.bodyBytes));
    Map<String, dynamic> profileData = responseData['data']['profile'];
    return profileData;
  } else {
    throw Exception('Failed to load user info');
  }
}

Future<void> updateUserInfo(Map<String, dynamic> updatedUserInfo) async {
  String apiUrl = 'https://gondergelsin.pythonanywhere.com/user/';

  final authToken = await authentication.getStoredData('auth_token');

  String requestBody = json.encode(updatedUserInfo);
  print(updatedUserInfo);

  http.Response response = await http.put(
    Uri.parse(apiUrl),
    headers: {
      'Authorization': 'Bearer $authToken',
      'Content-Type': 'application/json',
    },
    body: requestBody,
  );

  if (response.statusCode == 200) {
    print('Kullanıcı bilgileri güncellendi');
  } else {
    throw Exception('Kullanıcı bilgileri güncellenirken bir hata oluştu');
  }
}
