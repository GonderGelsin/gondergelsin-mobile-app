import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/order_succes/order_succes.dart';
import 'package:flutter_application_1/services/authentication.dart'
    as authentication;
import 'package:http/http.dart' as http;

class Order {
  String status;
  String postContent;
  String departureAddress;
  String arrivalAddress;
  String vehicleType;
  double weightLimit;
  String paymentMethod;

  Order({
    required this.status,
    required this.postContent,
    required this.departureAddress,
    required this.arrivalAddress,
    required this.vehicleType,
    required this.weightLimit,
    required this.paymentMethod,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        status: json['status'],
        postContent: json['post_content'],
        departureAddress: json['departure_address'],
        arrivalAddress: json['arrival_address'],
        vehicleType: json['vehicle_type'],
        weightLimit: json['weight_limit'],
        paymentMethod: json['payment_method'],
      );

  Map<String, dynamic> toJson() => {
        "status": "P",
        "post_content": postContent,
        "departure_address": departureAddress,
        "arrival_address": arrivalAddress,
        "vehicle_type": vehicleType == 'Motor' ? 'M' : 'C',
        "weight_limit": weightLimit,
        "payment_method": paymentMethod == 'Cash' ? 'CS' : 'CC'
      };

  Future<void> createOrder(BuildContext context) async {
    print(jsonEncode(toJson()));
    final url = Uri.parse('https://gondergelsin.pythonanywhere.com/order/');
    final authToken = await authentication.getStoredData('auth_token');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token $authToken'
      },
      body: jsonEncode(toJson()),
    );

    if (response.statusCode == 201) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OrderSuccesScreen()),
      );
    } else {
      throw Exception('Failed to create order');
    }
  }
}
