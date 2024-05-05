import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getUserInfo() async {
  String apiUrl = 'https://gondergelsin.pythonanywhere.com/user/';

  String authToken = '51df4ef237575b3b7981f5facc124961c34c2a03';

  http.Response response = await http.get(
    Uri.parse(apiUrl),
    headers: {'Authorization': 'Token $authToken'},
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);
    print(data);
    return data;
  } else {
    throw Exception('Failed to load user info');
  }
}
