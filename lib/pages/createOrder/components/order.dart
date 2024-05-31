class Order {
  String postContent;
  String departureAddress;
  String arrivalAddress;
  String vehicleType;
  String weightLimit;
  String paymentMethod;

  Order({
    required this.postContent,
    required this.departureAddress,
    required this.arrivalAddress,
    required this.vehicleType,
    required this.weightLimit,
    required this.paymentMethod,
  });

  Map<String, dynamic> toJson() => {
        'postContent': postContent,
        'departureAddress': departureAddress,
        'arrivalAddress': arrivalAddress,
        'vehicleType': vehicleType,
        'weightLimit': weightLimit,
        'paymentMethod': paymentMethod,
      };

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        postContent: json['postContent'],
        departureAddress: json['departureAddress'],
        arrivalAddress: json['arrivalAddress'],
        vehicleType: json['vehicleType'],
        weightLimit: json['weightLimit'],
        paymentMethod: json['paymentMethod'],
      );
}
