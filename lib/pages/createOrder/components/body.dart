import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/default_button.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/pages/order_succes/order_succes.dart';
import 'package:flutter_application_1/size_config.dart';
import 'package:flutter_application_1/translations/locale_keys.g.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String selectedOption1 = LocaleKeys.motor.tr();
  String selectedOption2 = "2 kg'a kadar";
  String selectedPaymentMethod = 'Nakit';
  TextEditingController postContentController = TextEditingController();
  TextEditingController departureAddressController = TextEditingController();
  TextEditingController arrivalAddressController = TextEditingController();

  Map<String, List<String>> dropdownOptions = {
    'Motor': ["2 kg'a kadar", "5 kg'a kadar", "10 kg'a kadar", "20 kg'a kadar"],
    'Ticari': [
      "20 kg'a kadar",
      "50 kg'a kadar",
      "75 kg'a kadar",
      "100 kg'a kadar"
    ],
  };

  List<String> paymentMethods = ['Nakit', "Kart"];
  bool isLoading = false;

  void _createOrder() {
    setState(() {
      isLoading = true; // Butona basıldığında isLoading true olacak
    });

    // Simulate a network request or other async operation
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false; // İşlem tamamlandığında isLoading false olacak
      });

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OrderSuccesScreen()),
      );
    });
  }

  Future<void> _showMap() async {
    Location departureLocation =
        (await locationFromAddress(departureAddressController.text)).first;
    Location arrivalLocation =
        (await locationFromAddress(arrivalAddressController.text)).first;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapScreen(
          departureLocation: departureLocation,
          arrivalLocation: arrivalLocation,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: getProportionateScreenHeight(40),
          ),
          // "Gönderi İçeriği" başlığı ve TextField
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(8),
                      child: Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenWidth(14),
                        ),
                      ),
                    ),
                    SizedBox(width: getProportionateScreenWidth(10)),
                    Text(
                      'Gönderi İçeriği',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenWidth(16),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TextField(
                  controller: postContentController,
                  decoration: InputDecoration(
                    hintText: 'Gönderi İçeriği',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(8),
                      child: Text(
                        '2',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenWidth(14),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Çıkış Adresi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenWidth(16),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                TextField(
                  controller: departureAddressController,
                  decoration: InputDecoration(
                    hintText: 'Çıkış Adresi',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(8),
                      child: Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenHeight(14),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Varış Adresi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenWidth(16),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                TextField(
                  controller: arrivalAddressController,
                  decoration: InputDecoration(
                    hintText: 'Varış Adresi',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          // "Araç ve Ağırlık Seçimi" başlığı ve Dropdownlar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(8),
                      child: Text(
                        '4',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenWidth(14),
                        ),
                      ),
                    ),
                    SizedBox(width: getProportionateScreenWidth(10)),
                    Text(
                      'Araç ve Ağırlık Seçimi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenWidth(16),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton<String>(
                          elevation: 4,
                          dropdownColor: Colors.white,
                          underline: Container(),
                          value: selectedOption1,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedOption1 = newValue!;
                              selectedOption2 =
                                  dropdownOptions[selectedOption1]![0];
                            });
                          },
                          items: <String>['Motor', 'Ticari']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                textAlign: TextAlign.center,
                              ),
                            );
                          }).toList(),
                          isExpanded: true,
                          icon: Image.asset(
                            'assets/icons/Arturo-Wibawa-Akar-Chevron-down-small.512.png',
                            width: getProportionateScreenWidth(20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: getProportionateScreenWidth(20)),
                    Expanded(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: DropdownButton<String>(
                          elevation: 4,
                          dropdownColor: Colors.white,
                          underline: Container(),
                          value: selectedOption2,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedOption2 = newValue!;
                            });
                          },
                          items: dropdownOptions[selectedOption1]!
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                textAlign: TextAlign.center,
                              ),
                            );
                          }).toList(),
                          isExpanded: true,
                          icon: Image.asset(
                            'assets/icons/Arturo-Wibawa-Akar-Chevron-down-small.512.png',
                            width: getProportionateScreenWidth(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          // "Ödeme Yöntemi" başlığı ve Dropdown
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(8),
                      child: Text(
                        '5',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenWidth(14),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Ödeme Yöntemi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenWidth(16),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: DropdownButton<String>(
                    elevation: 4,
                    dropdownColor: Colors.white,
                    underline: Container(),
                    value: selectedPaymentMethod,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedPaymentMethod = newValue!;
                      });
                    },
                    items: paymentMethods
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          textAlign: TextAlign.center,
                        ),
                      );
                    }).toList(),
                    isExpanded: true,
                    icon: Image.asset(
                      'assets/icons/Arturo-Wibawa-Akar-Chevron-down-small.512.png',
                      width: getProportionateScreenWidth(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          // "Haritayı Göster" butonu
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: DefaultButton(
              text: 'Haritayı Göster',
              press: _showMap,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          // "Gönder" butonu
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: DefaultButton(
              text: 'Gönder',
              press: _createOrder,
              isLoading: isLoading, // Butonun loading durumunu ayarlayın
            ),
          ),
        ],
      ),
    );
  }
}

class MapScreen extends StatelessWidget {
  final Location departureLocation;
  final Location arrivalLocation;

  MapScreen({
    required this.departureLocation,
    required this.arrivalLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Harita'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center:
              LatLng(departureLocation.latitude, departureLocation.longitude),
          zoom: 13.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(
                    departureLocation.latitude, departureLocation.longitude),
                builder: (ctx) => Container(
                  child: Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 40.0,
                  ),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point:
                    LatLng(arrivalLocation.latitude, arrivalLocation.longitude),
                builder: (ctx) => Container(
                  child: Icon(
                    Icons.location_on,
                    color: Colors.blue,
                    size: 40.0,
                  ),
                ),
              ),
            ],
          ),
        ],
        children: [],
      ),
    );
  }
}
