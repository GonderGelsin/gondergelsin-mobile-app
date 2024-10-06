import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gondergelsin_mobile_app/components/default_button.dart';
import 'package:gondergelsin_mobile_app/constants.dart';
import 'package:gondergelsin_mobile_app/pages/createOrder/components/order.dart';
import 'package:gondergelsin_mobile_app/size_config.dart';
import 'package:gondergelsin_mobile_app/translations/locale_keys.g.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String selectedOption1 = LocaleKeys.motor.tr();
  String selectedOption2 = LocaleKeys.up_to_2_kg.tr();
  String selectedPaymentMethod = LocaleKeys.payment_type_cash.tr();
  TextEditingController postContentController = TextEditingController();
  TextEditingController departureAddressController = TextEditingController();
  TextEditingController arrivalAddressController = TextEditingController();

  Map<String, List<String>> dropdownOptions = {
    'Motor': [
      LocaleKeys.up_to_2_kg.tr(),
      LocaleKeys.up_to_5_kg.tr(),
      LocaleKeys.up_to_10_kg.tr(),
      LocaleKeys.up_to_20_kg.tr()
    ],
    'Ticari': [
      LocaleKeys.up_to_20_kg.tr(),
      LocaleKeys.up_to_50_kg.tr(),
      LocaleKeys.up_to_75_kg.tr(),
      LocaleKeys.up_to_100_kg.tr()
    ],
  };

  List<String> paymentMethods = [
    LocaleKeys.payment_type_cash.tr(),
    LocaleKeys.payment_type_card.tr()
  ];
  bool isLoading = false;

  void _createOrder(BuildContext context) async {
    setState(() {
      isLoading = true;
    });

    try {
      final Order order = Order(
        status: "P",
        postContent: postContentController.text,
        departureAddress: departureAddressController.text,
        arrivalAddress: arrivalAddressController.text,
        vehicleType: selectedOption1,
        weightLimit:
            double.parse(selectedOption2.replaceAll(RegExp(r'\D'), '')),
        paymentMethod: selectedPaymentMethod,
      );

      await order.createOrder(context);

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
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
                      LocaleKeys.post_content.tr(),
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
                    hintText: LocaleKeys.post_content.tr(),
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
                      LocaleKeys.exit_address.tr(),
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
                    hintText: LocaleKeys.exit_address.tr(),
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
                      LocaleKeys.arrival_address.tr(),
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
                    hintText: LocaleKeys.arrival_address.tr(),
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
                      LocaleKeys.vehicle_and_weight_selection.tr(),
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
                    SizedBox(width: getProportionateScreenWidth(10)),
                    Text(
                      LocaleKeys.payment_method.tr(),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: DefaultButton(
              text: LocaleKeys.create_order.tr(),
              press: () => _createOrder(context),
              isLoading: isLoading,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
        ],
      ),
    );
  }
}
