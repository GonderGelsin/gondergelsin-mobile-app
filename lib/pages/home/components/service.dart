import 'dart:convert';

import 'package:flutter_application_1/pages/createOrder/components/order.dart';
import 'package:flutter_application_1/services/authentication.dart'
    as authentication;
import 'package:http/http.dart' as http;

Future<List<Order>> fetchOrders() async {
  final authToken = await authentication.getStoredData('auth_token');
  final response = await http.get(
    Uri.parse('https://gondergelsin.pythonanywhere.com/order/active/'),
    headers: {'Authorization': 'Token $authToken'},
  );

  if (response.statusCode == 200) {
    final List<dynamic> responseData =
        jsonDecode(utf8.decode(response.bodyBytes));

    List<Order> orders =
        responseData.map((json) => Order.fromJson(json)).toList();
    return orders;
  } else {
    throw Exception('Failed to load orders');
  }
}

Future<List<Order>> fetchComplatedOrders() async {
  final authToken = await authentication.getStoredData('auth_token');
  final response = await http.get(
    Uri.parse('https://gondergelsin.pythonanywhere.com/order/complated/'),
    headers: {'Authorization': 'Token $authToken'},
  );

  if (response.statusCode == 200) {
    final List<dynamic> responseData =
        jsonDecode(utf8.decode(response.bodyBytes));

    List<Order> orders =
        responseData.map((json) => Order.fromJson(json)).toList();
    return orders;
  } else {
    throw Exception('Failed to load orders');
  }
}
