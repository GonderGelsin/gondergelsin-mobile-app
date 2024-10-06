import 'dart:convert';

import 'package:http/http.dart' as http;

Future getAddressFromLocation(String location) async {
  final apiKey = "3iXaKk_NJB8BMUbR9XFY4anAc-S3tOQGeJvRhohShmU";
  final encodedLocation = Uri.encodeComponent(location);
  final url = Uri.parse(
      "https://geocode.search.hereapi.com/v1/geocode?q=$encodedLocation&apiKey=$apiKey");
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final decoded = json.decode(utf8.decode(response.bodyBytes));
    if (decoded['items'].isNotEmpty) {
      return decoded['items'][0]['address']['label'];
    } else {
      return 'Adres bulunamadı.';
    }
  }
}
