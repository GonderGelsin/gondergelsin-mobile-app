import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gondergelsin_mobile_app/translations/locale_keys.g.dart';

class TcKimlikForm extends StatefulWidget {
  @override
  _TcKimlikFormState createState() => _TcKimlikFormState();
}

class _TcKimlikFormState extends State<TcKimlikForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tcController = TextEditingController();
  String? tcNumber;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildTCFormField(),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // Do something with the valid T.C. Kimlik Numarası
                print("T.C. Kimlik No: $tcNumber");
              }
            },
            child: Text(LocaleKeys.submit.tr()),
          ),
        ],
      ),
    );
  }

  TextFormField buildTCFormField() {
    return TextFormField(
      controller: _tcController,
      keyboardType: TextInputType.number,
      maxLength: 11,
      onSaved: (newValue) => tcNumber = newValue,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return LocaleKeys.enter_id_no.tr();
        } else if (value.length != 11) {
          return LocaleKeys.id_must_be_11_digits.tr();
        } else if (int.tryParse(value) == null) {
          return LocaleKeys.id_only_numbers.tr();
        } else if (value[0] == '0') {
          return LocaleKeys.id_cannot_start_with_0.tr();
        } else if (!validateTCNumber(value)) {
          return LocaleKeys.invalid_id.tr();
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: LocaleKeys.id_no.tr(),
        hintText: LocaleKeys.enter_id_no.tr(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.person), // Kendi ikonunuzu kullanabilirsiniz
      ),
    );
  }

  bool validateTCNumber(String tc) {
    if (tc.length != 11) return false;
    int sumOdd = 0, sumEven = 0;
    for (int i = 0; i < 9; i += 2) {
      sumOdd += int.parse(tc[i]);
    }
    for (int i = 1; i < 8; i += 2) {
      sumEven += int.parse(tc[i]);
    }
    int checkDigit1 = (sumOdd * 7 - sumEven) % 10;
    int checkDigit2 = (sumOdd + sumEven + int.parse(tc[9])) % 10;

    return checkDigit1 == int.parse(tc[9]) && checkDigit2 == int.parse(tc[10]);
  }
}
