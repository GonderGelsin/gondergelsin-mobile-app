import 'package:flutter/material.dart';
import 'package:gonder_gelsin_application/size_config.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        errors.length,
        (index) => formErrorText(error: errors[index]),
      ),
    );
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        Image.asset(
          "assets/icons/Arturo-Wibawa-Akar-Triangle-alert.512.png",
          color: Colors.red,
          height: getProportionateScreenHeight(14),
        ),
        SizedBox(width: getProportionateScreenWidth(10)),
        Text(error),
      ],
    );
  }
}
